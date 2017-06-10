class AllinfosController < ApplicationController
  def index
    if !current_user
      redirect_to :login,:notice =>"请先登录或注册。"
    else
      @user = User.find(current_user)
      #新发布的应该处于列表第一个
      @allinfos = Allinfo.all.order(id: :desc)
      @alldata = Oneinfo.all
      @allinfo = @user.allinfos.build(params[:allinfo])
    end
  end 

  def show 
    @user = User.find(current_user)
    @allinfos = Allinfo.all
    @allinfo = @user.allinfos.find params[:id]
  end

  def create
    @user = User.find(current_user)
    @allinfo = @user.allinfos.create(allinfo_params)
    @allinfo.start_time = Time.now
    @allinfo.finish_time = Time.now
    @allinfo.save
    redirect_to allinfos_path
  end

  def destroy
    @allinfo = Allinfo.find(params[:id])
    @allinfo.destroy
    redirect_to allinfos_path
  end

  def join
    @oneinfo = Oneinfo.new(params[:oneinfo])
    @oneinfo.joined_id = params[:user_id]
    @oneinfo.allinfo_id = params[:allinfo_id]
    @oneinfo.save
    redirect_to allinfos_path
  end
  
  def newinfo
    @user = User.find(current_user)
    @allinfos = Allinfo.all
    @allinfo = @user.allinfos.build(params[:allinfo])
  end

  private
    def allinfo_params
      params.require(:allinfo).permit(:price, :title, :url, :max)
    end
    def oneinfo_params
      params.require(:oneinfo).permit(:joined_id,:allinfo_id)
    end
end
