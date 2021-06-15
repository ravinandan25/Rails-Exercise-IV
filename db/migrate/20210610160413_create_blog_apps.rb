class CreateBlogApps < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_apps do |t|
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
