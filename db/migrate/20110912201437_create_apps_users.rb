class CreateAppsUsers < ActiveRecord::Migration
  def up
    create_table :apps_users, id: false do |t|
      t.integer :app_id
      t.integer :user_id
    end
  end

  def down
    drop_table :apps, :users
  end
end
