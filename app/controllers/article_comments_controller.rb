class ArticleCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    comment = Comment.new(comment_params)
    article.comments << comment

    respond_to do |format|
      if comment.save
        current_user.comments << comment

        format.html { redirect_to article, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: article }
      else
        format.html { redirect_to articles_path }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.required(:comment).permit(:content)
    end

    def article
      @article ||= Article.find(params[:article_id])
    end
end
