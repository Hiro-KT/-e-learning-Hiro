class PagesController < ApplicationController

  def home
    if logged_in?
      @activity = Activity.new
      @activities = current_user.feed
      render 'users/home_feed'
    end
  end

end
