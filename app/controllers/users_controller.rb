class UsersController < ApplicationController
  def show
    @user = User.find_by_slug(request.subdomain)
    if @user.nil?
      head 404
    end
  end
end
