class AppsController < ApplicationController
  def show
    app_name = params[:app].downcase
    @app = App.find_by_app_name app_name
    unless @app.nil?
      result = App.search(app_name).first

      if result["trackName"].downcase == app_name
        @app = App.create_by_api(result)
      else
        head 404
      end
    end
  end
  
  def search
    results = App.search(params[:query])

    render json: results
  end

  def associate
    if current_user
      app_name = params[:app].downcase
      app = App.find_by_app_name app_name
      app.associate_user current_user
      head 200
    else
      head 403
    end
  end
end
