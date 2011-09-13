class HomeController < ApplicationController
  def index
    @user_count = User.all.count
    @app_count = App.linked_apps.count
    @recent_apps = App.where(linked: true).order('created_at DESC')
  end
end
