class SkillsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = current_user.skills.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    if !skill_already_exists?(skill_params)
      ## Find Skill in db , if it already exists, just take that otherwise create new
      @skill = Skill.all.where(title: skill_params[:title]).where(level: skill_params[:level]).first
      if @skill == nil
        @skill = Skill.new(skill_params)
        respond_to do |format|
          if @skill.save
            current_user.skills << @skill

            format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
            format.json { render :show, status: :created, location: @skill }
          else
            format.html { render :new }
            format.json { render json: @skill.errors, status: :unprocessable_entity }
          end
        end
      else
        current_user.skills << @skill
        respond_to do |format|
          format.html { redirect_to @skill, notice: 'Skill was successfully added to your Profile. ' }
          format.json { render :show, status: :created, location: @skill }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to skills_path, :flash => { :error => "This Skill already Exists" } }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    profileSkill = ProfileManager.find_by_skill_id(@skill.id)
    if profileSkill.destroy
      respond_to do |format|
        format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, :flash => { :error => "Profile Skill was not deleted" } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end
    def skill_already_exists?(opt = {})
      current_user.skills.all.where(title: opt[:title]).count == 1
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:title, :level)
    end
end
