class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by_email(params[:email])
      if @user   
        session[:current_user_id] = @user.id
        redirect_to root_url, notice: "Logged in!" and return
      else 
        flash.now[:notice] = "Could not find email."
        render action: "new"
      end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_url, notice: "Logged out!"
  end

end
