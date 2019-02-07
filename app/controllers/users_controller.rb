class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
      @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def password_change
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user)
    else
      render 'password_change'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_registration_url
  end

  private

  def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password,
                                    :link, :profile, :phone, :sex)
  end

  def feed
    Micropost.where("user_id = ?",id)
  end
end
