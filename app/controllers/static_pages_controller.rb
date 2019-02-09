class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end
