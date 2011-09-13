class UsersController < ApplicationController
  respond_to :html, :json
  def show
    @user = User.find_by_slug(request.subdomain)
    if @user.nil?
      head 404
    end
    respond_with @user
  end
end
