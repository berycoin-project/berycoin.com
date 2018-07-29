class UserDashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @projects = current_user.projects
    @articles = current_user.articles
    @comments = current_user.comments

  end
end
