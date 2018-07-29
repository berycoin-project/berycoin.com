class SocialsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_social, only: [:show, :edit, :update, :destroy]

  # GET /socials
  # GET /socials.json
  def index
    @socials = current_user.socials.all
  end

  # GET /socials/1
  # GET /socials/1.json
  def show
  end

  # GET /socials/new
  def new
    @social = Social.new
  end

  # GET /socials/1/edit
  def edit
  end

  # POST /socials
  # POST /socials.json
  def create
    if !social_already_exists?(social_params)
      @social = Social.new(social_params)

      respond_to do |format|
        if @social.save
          current_user.socials << @social
          format.html { redirect_to @social, notice: 'Social was successfully created.' }
          format.json { render :show, status: :created, location: @social }
        else
          format.html { render :new }
          format.json { render json: @social.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to socials_path, :flash => { :error => "This social Profile already Exists" } }
      end
    end

  end

  # PATCH/PUT /socials/1
  # PATCH/PUT /socials/1.json
  def update
    respond_to do |format|
      if @social.update(social_params)
        format.html { redirect_to @social, notice: 'Social was successfully updated.' }
        format.json { render :show, status: :ok, location: @social }
      else
        format.html { render :edit }
        format.json { render json: @social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socials/1
  # DELETE /socials/1.json
  def destroy
    socialAddress = ProfileManager.find_by_social_id(@social.id)
    if @social.destroy
      if socialAddress.destroy
        respond_to do |format|
          format.html { redirect_to socials_url, notice: 'Social was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path, :flash => { :error => "Profile Address was not deleted" } }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, :flash => { :error => "Could not delete the social link" } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find(params[:id])
    end
    def social_already_exists?(opt = {})
      current_user.socials.all.where(link: opt[:link]).count == 1
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def social_params
      params.require(:social).permit(:name, :link)
    end
end
