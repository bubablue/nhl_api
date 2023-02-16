class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :user
      t.string :user_id
      t.string :player_id

      t.timestamps
    end
  end
end
