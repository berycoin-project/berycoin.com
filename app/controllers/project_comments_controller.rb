class ProjectCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    project.comments << comment

    respond_to do |format|
      if comment.save
        current_user.comments << comment

        format.html { redirect_to project, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: project }
      else
        format.html { redirect_to projects_path }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.required(:comment).permit(:content)
    end

    def project
      @project ||= Project.find(params[:project_id])
    end
end
