class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.text :description
      t.references :learning, foreign_key: true, null: false

      t.timestamps
    end
  end
end
