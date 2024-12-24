class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
  
    if @article.save
      redirect_to @article, notice: 'Artículo creado con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to @article, notice: 'Artículo actualizado con éxito.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    puts "Intentando eliminar el artículo: #{@article.title}"
    @article.destroy
  
    redirect_to articles_path, notice: 'Artículo eliminado con éxito.'
  end
  
  
  
  
  
  
  private
  
    def article_params
      params.require(:article).permit(:title, :body)
    end
  end