class AddColumnImageUrlAndProfileUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :profilr_url, :string
  end
end
