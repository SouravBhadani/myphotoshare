class CreatePrettylinks < ActiveRecord::Migration
  def change
    create_table :prettylinks do |t|
      t.string :url
      t.string :title
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
