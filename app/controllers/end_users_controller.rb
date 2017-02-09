class EndUsersController < ApplicationController
  def new
	@enduser = EndUser.new
  end

  def create
	@enduser = EndUser.new(enduser_params)
	if @enduser.save
		log_in @enduser
		flash[:success] = "Welcome"
		redirect_to @enduser
	else
		render 'new'
	end
  end

  def show
	@enduser = EndUser.find(params[:id])
  end
  
  private
	def enduser_params
		params.require(:end_user).permit(:name, :email, :password,:password_confirmation)
	end
end
