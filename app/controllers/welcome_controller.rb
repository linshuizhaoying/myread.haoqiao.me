class WelcomeController < ApplicationController

  def admin
  	@users = User.all
  	@goodsinfos = Goodsinfo.all

  end 
  
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @goodsinfos = Goodsinfo.all
      @shares = Share.all
      @user = User.find(current_user)
      @letters = Letter.all
      @letter = @user.letters.build(params[:letter])
    end

  end
  	
  def redirect
		redirect_to :root ,:notice =>"注册成功"
  end
  private
    def letter_params
      params.require(:letter).permit(:title, :from_id, :belong_id, :content)
    end
end
