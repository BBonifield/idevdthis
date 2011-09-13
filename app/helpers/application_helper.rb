module ApplicationHelper
  def active_user_count
    User.all.count
  end

  def active_app_count
    App.linked_apps.count
  end

  def path_to_root
    if request.domain.match(/idevdthis\.com/)
      "idevdthis.com"
    elsif request.domain.match(/localhost/)
      "localhost:#{request.port}"
    elsif request.domain.match(/lvh.me/)
      "lvh.me:#{request.port}"
    end
  end
end
