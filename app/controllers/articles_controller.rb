class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate page: params[:page], per_page: 4
  end

  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      flash[:alert] = "Votre article a bien été enregistré."
      redirect_to action: :index
    else
      flash[:alert] = "Votre article n'a pas pu être enregistré."
      render "new"
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
