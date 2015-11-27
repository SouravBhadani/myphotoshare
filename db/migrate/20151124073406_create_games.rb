class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :p_score
      t.integer :d_score
      t.string :result
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
