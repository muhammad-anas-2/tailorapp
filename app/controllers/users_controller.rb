class UsersController < ApplicationController

  skip_before_action  :require_user, only:[ :new , :create]
  # before_action :require_same_student, only: [:edit, :update]


  def index
    @users = User.all

  end
  def new
    @users = User.new
  end
  def show
    @users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])

  end
  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @users

    else
      render 'edit'
    end
  end

  def create
    @users = User.new(user_params)
    if @users.save
      # NewUserEmailMailer.with(users: @users).notify_user.deliver_now
      flash[:notice] = "You have successfully signed up"
      redirect_to login_path
    else
      render 'new'
    end
  end


end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation )
end

# def require_same_student
#   if  current_user != @users
#     flash[:notice] = "you can only edit your profile"
#     redirect_to users_path(current_user)
#
#
#   end
#
# end

