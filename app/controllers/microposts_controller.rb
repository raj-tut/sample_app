class MicropostsController < ApplicationController
  before_filter :signed_in_user, only:[:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end


  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # creating an empty feed item so that when incorrect feed submitted, 
      # page does not error out.
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url  
  end

  private

    def correct_user
      # we use find_by_id instead of find because the latter raises an exception 
      # when the micropost doesn’t exist instead of returning nil
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
    

     # if you’re comfortable with exceptions in Ruby, 
     #  you could also write the correct_user filter like this:
    # def correct_user
    #   @micropost = current_user.microposts.find(params[:id])
    # rescue
    #   redirect_to root_url
    # end  


    # we could implement the correct_user filter using the Micropost model directly.
    # as explained by Wolfram Arnold in the blog post "Access Control 101 in Rails and the Citibank Hack", 
    # for security purposes it is a good practice always to run lookups through the association.
    # @micropost = Micropost.find_by_id(params[:id])
    # redirect_to root_url unless current_user?(@micropost.user)
end