class MonthlyController < ApplicationController
	def index
	    if !current_user
	      redirect_to :login,:notice =>"请先登录或注册。"
	    else
	    end
	end
end
