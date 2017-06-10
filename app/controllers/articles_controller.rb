class ArticlesController < ApplicationController
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @user = User.find(current_user)
      @articles = Article.all.order(id: :desc)
      @article = @user.articles.build(params[:article])
    end
  end
  def show 
     @user = User.find(current_user)
     @articles = Article.all
     @article = @articles.find params[:id]
  end

  def create
    @user = User.find(current_user)
    @article = @user.articles.create(article_params)
    @article.createtime = Time.now
    @article.updatetime = Time.now
    @article.save
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def publish
    @user = User.find(current_user)
    @articles = Article.all
    @article = @user.articles.build(params[:article])
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :createtime, :updatetime)
    end
end
