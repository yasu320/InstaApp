class MicropostsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def new
    if user_signed_in?
      @micropost = current_user.microposts.build
      render :new, layout: "eliminated_view"
    end
  end

  def destroy
    @micropost.destroy
    redirect_to request.referrer || @user
  end

  private

    def micropost_params
      params.require(:micropost).permit(:picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
