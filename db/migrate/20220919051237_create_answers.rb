class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :answer, null: false, default: false
      t.references :player, foreign_key: true, null: false

      t.timestamps
    end
  end
end
