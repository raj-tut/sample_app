module SessionsHelper
	

	def current_user=(user)
    @current_user = user
  	end

	def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  	end

  	def current_user?(user)
  		user == current_user
  	end

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	def signed_in_user
   	 unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
   	 end
 	end

 	def signed_in_user
      store_location  # calls this method to store the requested url
      # before_filter in the users controller calls this method. For user edit and update
      # actions, it checks to see if the user is logged-in or not.
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
      # The code in the line above is the same as the one commented below.
      # flash[:notice] = "Please sign in."
      # redirect_to signin_url
    end

end
