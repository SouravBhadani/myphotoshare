class AddColumnSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, unique: true
    add_index  :users, :slug
    add_column :blogs, :slug, :string, unique: true
    add_index  :blogs, :slug
  end
end
