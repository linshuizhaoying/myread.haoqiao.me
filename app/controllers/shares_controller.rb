class SharesController < ApplicationController
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @user = User.find(current_user)
      @shares = Share.all
      @share = @user.shares.build(params[:share])
    end
  end

  def create
    @user = User.find(current_user)
    @share = @user.shares.create(share_params)
    @share.createtime = Time.now
    @share.updatetime = Time.now
    @share.save
    redirect_to shares_path
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    redirect_to shares_path
  end

  def newshare
    @user = User.find(current_user)
    @shares = Share.all
    @share = @user.shares.build(params[:share])
  end

  private
    def share_params
      params.require(:share).permit(:title, :link, :limit, :createtime , :updatetime)
    end
end
