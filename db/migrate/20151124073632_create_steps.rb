class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :p_card
      t.string :d_card
      t.references :game, index: true, foreign_key: true
      t.string :step_type

      t.timestamps null: false
    end
  end
end
