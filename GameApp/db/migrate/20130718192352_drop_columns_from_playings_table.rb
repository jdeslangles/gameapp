class DropColumnsFromPlayingsTable < ActiveRecord::Migration
   def change
     remove_column :playings, :draw
     remove_column :playings, :win
     remove_column :playings, :lose
  end
end
