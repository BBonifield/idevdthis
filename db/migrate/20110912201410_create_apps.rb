class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :app_id
      t.string :store_url
      t.string :icon_url_60
      t.string :icon_url_100
      t.string :publisher
      t.string :user_rating
      t.string :icon_url_512

      t.timestamps
    end
  end
end
