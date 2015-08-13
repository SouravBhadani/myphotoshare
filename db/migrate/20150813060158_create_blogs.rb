class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :desc
      t.string :url
      t.string :tags
      t.string :type
      t.string :sub_type
      t.integer :user_id

      t.timestamps
    end
  end
end
