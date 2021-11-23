class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successful"
      redirect_to '/'
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to '/login'
    end
  end

  
def destroy
  session[:user_id] = nil
  flash[:notice] = "You have logged out"
  redirect_to '/login'
end
end
