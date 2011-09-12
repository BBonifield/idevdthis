class UsersController < ApplicationController
  def show
    @user = User.find_by_slug(request.subdomain)
    redirect_to root_path if @user.nil?
  end
end
