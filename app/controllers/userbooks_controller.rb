class UserbooksController < ApplicationController
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @user = User.find(current_user)
      @userbooks = Userbook.all
      @userbook = @user.userbooks.build(params[:userbook])
    end
  end 

  def show 
     @user = User.find(current_user)
     @userbooks = Userbook.all
     @userbook = @user.userbooks.find params[:id]
  end

  def create
    @user = User.find(current_user)
    @userbook = @user.userbooks.create(userbook_params)
    @userbook.createtime = Time.now
    @userbook.updatetime = Time.now
    @userbook.save
    redirect_to userbooks_path
  end

  def publish
    @user = User.find(current_user)
    @userbooks = Userbook.all
    @userbook = @user.userbooks.build(params[:userbook])
  end

  private
    def userbook_params
      params.require(:userbook).permit(:desc, :title, :body, :createtime, :updatetime,:img)
    end
end
