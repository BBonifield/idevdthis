class AppsController < ApplicationController
  def show
    app_name = params[:app].downcase
    @app = App.where("name LIKE ?", app_name).first

    unless @app
      result = ITunesSearchAPI.search(term: app_name, media: 'software').first
      if result["trackName"].downcase == app_name
        @app = App.create_by_api(result)
      else
        head 404
      end
    end
    @app
  end
  
  def search
    query = params[:query]
  end
end
