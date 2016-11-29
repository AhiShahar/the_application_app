class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate( params[:password])
      flash[:success] = "You succesfully logged in"
      session[:user_id] = user.id

      redirect_to users_path
    else
      flash[:error] = "The password or email did not match"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
