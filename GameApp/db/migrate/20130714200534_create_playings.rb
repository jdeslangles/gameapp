class CreatePlayings < ActiveRecord::Migration
  def change
    create_table :playings do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :player_position
      t.integer :finish_position

      t.timestamps
    end
  end
end
