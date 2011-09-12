class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth)
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    self.current_user = @auth.user

    redirect_to root_path, notice: "Logged in as #{current_user.username}"
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: "Logged out"
  end
end
