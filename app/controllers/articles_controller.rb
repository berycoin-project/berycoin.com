class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  include ArticlesHelper

  # GET /articles
  # GET /articles.json
  def index
    @articles = current_user.articles.all
    @article_count = Article.all.count
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comments = @article.comments.order('created_at DESC')
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    if !article_already_exists?(article_params)
      @article = Article.new(article_params)

      if category_count(article_params[:category]) <= 10
        respond_to do |format|
          if @article.save
            categories = article_params[:category].split(',')
            categories.each do |ct|
              $cat = Category.find_by_name(ct)
              if $cat == nil
                $cat = Category.new(name: ct)
                $cat.save
                @article.categories << $cat
              else
                @article.categories << $cat
              end
            end

            @article.statuses << newStatus
            current_user.articles << @article

            format.html { redirect_to @article, notice: 'Article was successfully created.' }
            format.json { render :show, status: :created, location: @article }
          else
            format.html { render :new }
            format.json { render json: @article.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to articles_path, :flash => { :error => "You can only choose 5 or less categories" } }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to articles_path, :flash => { :error => "This Article already Exists" } }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if category_count(article_params[:category]) <= 10
      @article.categories.destroy_all

      categories = article_params[:category].split(',')
      categories.each do |ct|
        $cat = Category.find_by_name(ct)
        if $cat == nil
          $cat = Category.new(name: ct)
          $cat.save
          @article.categories << $cat
        else
          @article.categories << $cat
        end
      end

      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_path, :flash => { :error => "You can only choose 10 or less categories" } }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article ||= Article.find(params[:id])
    end
    def article_already_exists?(opt = {})
      current_user.articles.all.where(title: opt[:title]).count == 1
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title,:article_cover,:content, :category)
    end
end
