require 'spec_helper'

describe "tictactoe_moves/edit" do
  before(:each) do
    @tictactoe_move = assign(:tictactoe_move, stub_model(TictactoeMove,
      :game_id => 1,
      :player_id => 1,
      :move_square => 1,
      :symbol => "MyString",
      :winning_move => "MyString"
    ))
  end

  it "renders the edit tictactoe_move form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tictactoe_moves_path(@tictactoe_move), :method => "post" do
      assert_select "input#tictactoe_move_game_id", :name => "tictactoe_move[game_id]"
      assert_select "input#tictactoe_move_player_id", :name => "tictactoe_move[player_id]"
      assert_select "input#tictactoe_move_move_square", :name => "tictactoe_move[move_square]"
      assert_select "input#tictactoe_move_symbol", :name => "tictactoe_move[symbol]"
      assert_select "input#tictactoe_move_winning_move", :name => "tictactoe_move[winning_move]"
    end
  end
end
