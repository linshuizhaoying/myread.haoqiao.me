class GoodsinfosController < ApplicationController
	def new
	  @goodsinfo = Goodsinfo.new
	end
	def create
	      @goodsinfo = Goodsinfo.new(goodsinfo_params)
		  @goodsinfo.save
		  redirect_to @goodsinfo
	    end

		def edit
		  @goodsinfo = Goodsinfo.find(params[:id])
		end

		def show
		  @goodsinfo = Goodsinfo.find(params[:id])
		end

		def update
		  @goodsinfo = Goodsinfo.find(params[:id])
		 
		  if @goodsinfo.update(goodsinfo_params)
		    redirect_to @goodsinfo
		  else
		    render 'edit'
		  end
		end

		def destroy
		  @goodsinfo = Goodsinfo.find(params[:id])
		  @goodsinfo.destroy
		 
		  redirect_to goodsinfos_path
		end
		 
		private
		  def goodsinfo_params
		    params.require(:goodsinfo).permit(:title,:url)
		  end
end


