class Admin::RegistrationController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params_create)
		@user.password = @user.password_confirmation = Array.new(8) { (rand(122-97) + 97).chr }.join
	    if @user.save
	    	@user.send_password_reset
	    	redirect_to root_url	
	    else
	       render 'new'  
	    end
	end

	def edit
	  	@user = User.find_by_reset_password_token!(params[:id])
	end

	def update
		@user = User.find_by_reset_password_token!(params[:id])
		if @user.reset_password_sent_at < 2.hours.ago
			redirect_to new_admin_registration_path, :alert => "Password &crarr;  reset has expired."
		elsif @user.update_attributes(user_params_update)
			redirect_to root_url, :notice => "Password has been reset."
		else
			render :edit
		end
	end

    def user_params_create
		params.require(:@user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def user_params_update
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end