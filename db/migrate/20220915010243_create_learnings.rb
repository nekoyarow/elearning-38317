class CreateLearnings < ActiveRecord::Migration[6.0]
  def change
    create_table :learnings do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.text :comment, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
