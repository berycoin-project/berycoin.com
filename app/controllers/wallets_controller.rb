require 'berycoin/gem'
require 'json'

class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wallet, only: [:show, :destroy]

  # GET /wallets
  # GET /wallets.json
  def index
    @wallets = current_user.wallets
    @vests = current_user.vests
    @ranks = current_user.ranks

    @wallets.each do |wallet|
      wallet.balance = Berycoin::Wallet.getreceivedbyaddress wallet.address
      wallet.save
    end

    if @ranks.count == 0
      @rank = Rank.find_by_name("peridoto")
      current_user.ranks << @rank
    end

    if @wallets.count == 0
      @wallet = Wallet.new
      @wallet.label = current_user.email
      @wallet.address = Berycoin::Wallet.getnewaddress @wallet.label


      respond_to do |format|
        if @wallet.save
          current_user.wallets << @wallet
        end
      end
    end

    if @vests.count == 0

      @vest = Vest.new
      @vest.name = current_user.email
      @vest.balance = 0
      @vest.expire_at = 1.month.from_now

      respond_to do |format|
        if @vest.save
          current_user.vests << @vest

          format.html { redirect_to wallets_path, notice: 'Vest was successfully created.' }
          format.json { render :show, status: :created, location: @vest }
        else
          format.html { render :new }
          format.json { render json: @vest.errors, status: :unprocessable_entity }
        end
      end
    end

    balance = Berycoin::Wallet.getbalance @wallets.last.label
    @totalBalance =  (balance - current_user.vests.sum(&:balance)).to_f.floor2(4) #Berycoin::Wallet.getbalance @wallets.last.label
    @transactions = Berycoin::Wallet.listtransactions @wallets.last.label

  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
  end

  # GET /wallets/new
  def new
    @wallet = Wallet.new
  end

  # POST /wallets
  # POST /wallets.json
  def create
    if current_user.wallets.count < 7
      @wallet = Wallet.new
      @wallet.label = current_user.email
      @wallet.address = Berycoin::Wallet.getnewaddress @wallet.label
      @wallet.balance = Berycoin::Wallet.getreceivedbyaddress @wallet.address
      respond_to do |format|
        if @wallet.save
          current_user.wallets << @wallet
          format.html { redirect_to wallets_path, notice: 'Wallet was successfully created.' }
          format.json { render :show, status: :created, location: @wallet }
        else
          format.html { render :new }
          format.json { render json: @wallet.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to wallets_path, :flash => { :error => "You can only create 7 Addresses" } }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1
  # DELETE /wallets/1.json
  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to wallets_url, notice: 'Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end
    def wallet_already_exists?(opt = {})
      current_user.wallets.all.where(label: opt[:label]).count == 1
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_params
      params.require(:wallet).permit()
    end
end
class Float
  def floor2(exp = 0)
    multiplier = 10 ** exp
    ((self * multiplier).floor).to_f/multiplier.to_f
  end
end