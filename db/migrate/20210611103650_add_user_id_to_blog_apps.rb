class AddUserIdToBlogApps < ActiveRecord::Migration[6.1]
  def change
    add_column :blog_apps, :user_id, :integer
    add_index :blog_apps, :user_id
  end
end
