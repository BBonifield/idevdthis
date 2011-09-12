class App < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.create_by_api(params)
    app = App.new

    app.name = params["trackName"]
    app.app_id = params["trackId"]
    app.publisher = params["sellerName"]
    app.icon_url_60 = params["artworkUrl60"]
    app.icon_url_100 = params["artworkUrl100"]
    app.icon_url_512 = params["artworkUrl512"]
    app.user_rating = params["averageUserRating"]
    app.store_url = params["trackViewUrl"]

    app if app.save
  end
end
