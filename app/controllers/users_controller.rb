class UsersController < ApplicationController
  # before filter, which arranges for a particular 
  # method to be called before the given actions.
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to One Family!"
  		redirect_to @user
  	else
      render 'new'
  	end
	
  end

  def edit
    # Since the correct_user before_filter defines @user,
    # we no longer need this code here.
    # @user = User.find(params[:id])
  end

  def update
    # If the update is sucessful, the app signs in the user. 
    # if update fails, it redirects the user to edit page.

    # Since the correct_user before_filter defines @user,
    # we no longer need the immediate line below.
    # @user = User.find{params[:id]}
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end    
  end

  def index
    @users = User.paginate(page: params[:page])
  end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User Destroyed"
  redirect_to users_url
end

private

    def signed_in_user
      store_location  # calls this method to store the requested url
      # before_filter at the top of this page calls this method. For user edit and update
      # actions, it checks to see if the user is logged-in or not.
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
      # The code in the line above is the same as the one commented below.
      # flash[:notice] = "Please sign in."
      # redirect_to signin_url
    end

    def correct_user
      # This method redirects the user to home page 
      # if the current user is trying to edit another user.
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
