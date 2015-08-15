class ChangBTypeInBlogs < ActiveRecord::Migration
 def up
    change_column :blogs, :desc, :text
 end

 def down
   change_column :blogs, :desc, :string
 end
end
