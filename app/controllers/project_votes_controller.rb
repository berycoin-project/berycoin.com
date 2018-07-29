# frozen_string_literal: true

class ProjectVotesController < ApplicationController
  before_action :authenticate_user!
  def create
    vote = Vote.new(vote_params)

    respond_to do |format|
      if vote.save
        current_user.votes << vote
        project.votes << vote

        format.html { redirect_to project, notice: 'vote was successfully posted.' }
        format.json { render :show, status: :created, location: project }
      else
        format.html { redirect_to projects_path }
        format.json { render json: vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def vote_params
    params.required(:vote).permit(:weight, :vote_type, :description)
  end

  def project
    @project ||= Project.find(params[:project_id])
  end
end
