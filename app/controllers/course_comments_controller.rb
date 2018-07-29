class CourseCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    comment = Comment.new(comment_params)
    course.comments << comment

    respond_to do |format|
      if comment.save
        current_user.comments << comment

        format.html { redirect_to course, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: course }
      else
        format.html { redirect_to courses_path }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.required(:comment).permit(:content)
    end

    def course
      @course ||= Course.find(params[:course_id])
    end
end
