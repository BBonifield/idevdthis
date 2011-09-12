class UsersController < ApplicationController
  def show
    @user = User.find_by_slug(request.subdomain)
  end
end
