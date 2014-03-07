class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.save
    if @article.persisted?
      flash[:alert] = "Bravo !"
      redirect_to action: :index
    else
      flash[:alert] = "Attention !"
      render "new"
    end
  end
end
