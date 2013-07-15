require 'spec_helper'

describe "tictactoe_moves/new" do
  before(:each) do
    assign(:tictactoe_move, stub_model(TictactoeMove,
      :game_id => 1,
      :player_id => 1,
      :move_square => 1,
      :symbol => "MyString",
      :winning_move => "MyString"
    ).as_new_record)
  end

  it "renders new tictactoe_move form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tictactoe_moves_path, :method => "post" do
      assert_select "input#tictactoe_move_game_id", :name => "tictactoe_move[game_id]"
      assert_select "input#tictactoe_move_player_id", :name => "tictactoe_move[player_id]"
      assert_select "input#tictactoe_move_move_square", :name => "tictactoe_move[move_square]"
      assert_select "input#tictactoe_move_symbol", :name => "tictactoe_move[symbol]"
      assert_select "input#tictactoe_move_winning_move", :name => "tictactoe_move[winning_move]"
    end
  end
end
