class AddLinkedToApp < ActiveRecord::Migration
  def change
    add_column :apps, :linked, :boolean
  end
end
