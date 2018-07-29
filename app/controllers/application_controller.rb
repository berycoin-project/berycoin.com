class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ApplicationHelper

  def needs_to_be_admin
    unless is_admin?
      respond_to do |format|
        format.html { redirect_to root_path, :flash => { :error => "You need to be an Admin to do this task" } }
      end
    end
  end
  def needs_to_be_leader
    unless is_leader?
      respond_to do |format|
        format.html { redirect_to root_path, :flash => { :error => "You need to be a Leader to do this task" } }
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
