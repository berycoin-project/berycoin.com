class RolesController < ApplicationController

  before_action :needs_to_be_leader, except: [:index, :show]
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = current_user.roles.all
    @allRoles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    if !role_already_exists?(role_params)
      @role = Role.new(role_params)
      respond_to do |format|
        if @role.save
          format.html { redirect_to @role, notice: 'Role was successfully created.' }
          format.json { render :show, status: :created, location: @role }
        else
          format.html { render :new }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to roles_path, :flash => { :error => "This role already Exists" } }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    userRole = UserRole.find_by_role_id(@role.id)

    if @role.destroy
      if userRole.destroy
        respond_to do |format|
          format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path, :flash => { :error => "User role was not deleted" } }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, :flash => { :error => "Could not delete the role" } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end
    def role_already_exists?(opt = {})
      Role.all.where(name: opt[:name]).count == 1
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :description)
    end
end
