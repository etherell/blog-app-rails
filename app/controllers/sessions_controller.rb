class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	redirect_to user_path(user)
    else
      flash[:danger] = 'Please, try again'
      render 'new'
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end
