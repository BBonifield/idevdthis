class CreateAppDevelopers < ActiveRecord::Migration
  def change
    create_table :app_developers do |t|
      t.integer :user_id
      t.integer :app_id
      t.boolean :linked

      t.timestamps
    end
  end
end
