class AddColumnToPlayingsTable < ActiveRecord::Migration
   def change
     add_column :playings, :draw, :integer
  end
end
