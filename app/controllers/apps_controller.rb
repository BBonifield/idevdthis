class AppsController < ApplicationController
  respond_to :html, :json
  def index
    @apps = App.where(linked: true).paginate(page: params[:page])
  end

  def show
    app_name = params[:app].downcase
    @user = User.find_by_slug(request.subdomain) || current_user
    @app = App.find_by_app_name app_name

    if @app.nil?
      matching_results = App.search(app_name).select do |result|
        result['trackName'].downcase == app_name
      end

      if matching_results.length == 1
        @app = App.create_by_api(matching_results[0])
      else
        head 404
        return
      end
    end
    respond_with @app
  end
  
  def search
    results = App.search(params[:query]).first(5)

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
      redirect_to URI.escape("/#{app.name}")
    else
      redirect_to root_path
    end
  end
end
