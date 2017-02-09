class AdminUsersController < ApplicationController
  def new
	@admin_user = AdminUser.new
  end

  def create
	@admin_user = AdminUser.new(adminuser_params)
	if @admin_user.save
		log_in @admin_user
		flash[:success] = "Welcome"
		redirect_to @admin_user
	else
		render 'new'	
	end
  end

  def show
	@admin_user = AdminUser.find(params[:id])
  end
  
  private
	def adminuser_params
		params.require(:admin_user).permit(:name, :email, :password,:password_confirmation)
	end
end
