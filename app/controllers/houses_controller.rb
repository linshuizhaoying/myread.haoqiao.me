class HousesController < ApplicationController
	def index
	    if !current_user
	      redirect_to :login,:notice =>"请先登录或注册。"
	    else
		  @user = User.find(current_user)
		  @users = User.all
		  @letters = Letter.all
	      @new = @user.letters.build(params[:letter])
	    end
	end	
	
	def letters
      @user = User.find(current_user)
      @letters = Letter.all
    end
   
    def create

    end

	def show
		#render plain: params[:house_name]
		
	end
  private
    def letter_params
      params.require(:letter).permit(:title, :from_id, :belong_id, :content)
    end

end