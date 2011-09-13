module ApplicationHelper
  def active_user_count
    User.all.count
  end

  def active_app_count
    App.linked_apps.count
  end
end
