class RenameColumnTypeToCategoryInBlogs < ActiveRecord::Migration
  def up
    rename_column(:blogs, :type, :category)
  end
  
  def down
    rename_column(:blogs, :category, :type)
  end
end
