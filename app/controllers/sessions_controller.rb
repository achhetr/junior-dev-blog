class SessionsController < ApplicationController 
  def new
  end

  def create
    user = User.find_by(email: user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login detail"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end