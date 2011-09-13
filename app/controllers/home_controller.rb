class HomeController < ApplicationController
  def index
    @recent_apps = App.where(linked: true).order('created_at DESC')
  end
end
