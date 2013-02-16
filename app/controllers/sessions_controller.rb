class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			# This redirect method directs the user to the original url he chose.
			# if not, then it takes the user to default login page.
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
