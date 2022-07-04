class LoginsController < ApplicationController
  # skip_before_action :require_user , only: [:new , :create]
  def new

  end

  def create
    user = User.find_by(email: params[:logins][:email].downcase)
    if user  &&  user.authenticate(params[:logins][:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in'

      redirect_to clients_path

       else
            flash.now[:alert] = 'Something is wrong with your login information'
            render 'logins/new'
        end


  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to login_path
  end
end