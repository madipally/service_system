class StaffUsersController < ApplicationController
  def new
    @staffuser = StaffUser.new
  end
  
  def show
	@staffuser = StaffUser.find(params[:id])
  end
  
  def create
	@staffuser = StaffUser.new(staffuser_params)
	if @staffuser.save
		log_in @staffuser
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @staffuser
	else
		render 'new'
	end
  end
  private
  
  def staffuser_params
      params.require(:staff_user).permit(:name, :email, :password,:password_confirmation)
  end
end
