class AddColumnsToPlayingsTable < ActiveRecord::Migration
  def change
     add_column :playings, :win, :integer
     add_column :playings, :lose, :integer
  end
end
