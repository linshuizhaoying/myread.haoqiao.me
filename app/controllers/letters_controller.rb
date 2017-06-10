class LettersController < ApplicationController
	def index

	end

    def create
	  @user = User.find(current_user)
	  @new = @user.letters.create(letter_params)

	  if @new.save
        @old_letter=Letter.find(@new.state.to_i)
        @old_letter.state = -1
        @old_letter.save
	  end

	  redirect_to houses_path
	end 

  private
    def letter_params
      params.require(:letter).permit(:title, :from_id, :belong_id, :content ,:state)
    end
end
