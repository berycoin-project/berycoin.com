require 'berycoin/gem'

class TransactionController < ApplicationController
  before_action :authenticate_user!
  before_action :wallet, only: [:create]

  include WalletsHelper

  def index
    @wallets = current_user.wallets
  end

  def invest
    balance = Berycoin::Wallet.getbalance current_user.wallets.last.label
    remaining =  balance - current_user.vests.sum(&:balance) #Berycoin::Wallet.getbalance @wallets.last.label
    if remaining >= amount.to_f
      @vest = current_user.vests.first
      @vest.balance += amount.to_f.floor2(4)
      @vest.expire_at = 1.minute.from_now

      rank = get_rank(@vest.balance)

      ProfileManager.all.where(user_id: current_user.id).where("rank_id IS NOT NULL").destroy_all

      respond_to do |format|
        if @vest.save
          current_user.ranks << rank

          format.html { redirect_to wallets_path, notice: amount + ' Bery was successfully Invested' }
          format.json { render :show, status: :ok, location: wallets_path }
        else
          format.html { redirect_to wallets_path, :flash => { :error => "We could not make this transaction" } }
          format.json { render json: @vest.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to wallets_path, :flash => { :error => "Insufficient funds" } }
        format.json { render json: @vest.errors, status: :unprocessable_entity }
      end
    end
  end

  def devest
    if is_payout?
      @vest = current_user.vests.first
      @vest.balance = 0
      rank = get_rank(@vest.balance)

      ProfileManager.all.where(user_id: current_user.id).where("rank_id IS NOT NULL").destroy_all

      respond_to do |format|
        if @vest.save
          current_user.ranks << rank

          format.html { redirect_to wallets_path, notice: 'Successfully Divested' }
          format.json { render :show, status: :ok, location: wallets_path }
        else
          format.html { redirect_to wallets_path, :flash => { :error => "We could not make this transaction" } }
          format.json { render json: @vest.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to wallets_path, :flash => { :error => "You need to wait more!" } }
        format.json { render json: @vest.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    begin
      if Berycoin::Wallet.sendfrom current_user.email, address, amount
        respond_to  do |format|
          format.html { redirect_to wallets_path, notice: "Sent "+ amount + " BERY to " + address}
          format.json { render :show, status: :created, location: wallets_path }
        end
      end
    rescue
      respond_to do |format|
        format.html { redirect_to wallets_path, :flash => { :error => "We could not make this transaction" } }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def address
      params[:wallet_address]
    end
    def amount
      params[:send_amount]
    end
    def wallet
      @wallet ||= current_user.wallets.last
    end
end
class Float
  def floor2(exp = 0)
    multiplier = 10 ** exp
    ((self * multiplier).floor).to_f/multiplier.to_f
  end
end