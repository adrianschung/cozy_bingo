class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Signup successful"
    else
      flash[:notice] = user.errors.full_messages.join("\n")
      redirect_to signup_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :ign, :password, :password_confirmation)
  end
end
