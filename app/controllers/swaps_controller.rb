class SwapsController < ApplicationController
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @user = User.find(current_user)
      @swaps = Swap.all
      @swap = @user.swaps.build(params[:swap])
    end
  end

  def create
    @user = User.find(current_user)
    @swap = @user.swaps.create(swap_params)
    @swap.save
    redirect_to swaps_path
  end 

  def join
    @swaps = Swap.all
    @user = User.find(current_user)
    @swap = Swap.find(params[:swap_id])
    @swap.guest_id = params[:user_id]
    @swap.state = 1
    @swap.save

    @letter = Letter.new(params[:letter])
    @letter.title = "以旧易书:您的发布有人回应啦！快给他（她）回信吧"
    @letter.from_id = @user.id
    @letter.belong_id = params[:user_id]
    @letter.user_id = params[:user_id]
    @letter.content = "你好，我对你在以旧易书中发布的书很有兴趣，请尽快回信。"
    @letter.save

    redirect_to swaps_path
  end

  def newswap
    @user = User.find(current_user)
    @swaps = Swap.all
    @swap = @user.swaps.build(params[:swap])
  end

  private
    def swap_params
      params.require(:swap).permit(:title, :age, :extent, :want_book , :guest_id, :state)
    end
    def letter_params
      params.require(:letter).permit(:title, :from_id, :belong_id, :content)
    end
end
