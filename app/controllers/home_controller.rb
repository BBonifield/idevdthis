class HomeController < ApplicationController
  def index
    @user_count = User.all.count
    @app_count = App.all.count
    @recent_apps = App.all
  end
end
