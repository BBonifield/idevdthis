class AppsController < ApplicationController
  respond_to :html, :json
  def show
    app_name = params[:app].downcase
    @user = User.find_by_slug(request.subdomain) || current_user
    @app = App.find_by_app_name app_name

    if @app.nil?
      result = App.search(app_name).first

      if result && result["trackName"].downcase == app_name
        @app = App.create_by_api(result)
      else
        head 404
        return
      end
    end
    respond_with @app
  end
  
  def search
    results = App.search(params[:query])

    results_for_display = results.map do |result|
      {
        id: result['trackId'],
        label: result['trackName'],
        value: result['trackName'],
        url: "/#{URI.escape( result['trackName'] )}"
      }
    end
    render json: results_for_display
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
