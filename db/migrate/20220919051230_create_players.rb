class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true, null: false
      t.references :learning, foreign_key: true, null: false

      t.timestamps
    end
  end
end
