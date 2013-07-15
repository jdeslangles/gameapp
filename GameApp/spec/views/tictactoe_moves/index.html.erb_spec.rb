require 'spec_helper'

describe "tictactoe_moves/index" do
  before(:each) do
    assign(:tictactoe_moves, [
      stub_model(TictactoeMove,
        :game_id => 1,
        :player_id => 2,
        :move_square => 3,
        :symbol => "Symbol",
        :winning_move => "Winning Move"
      ),
      stub_model(TictactoeMove,
        :game_id => 1,
        :player_id => 2,
        :move_square => 3,
        :symbol => "Symbol",
        :winning_move => "Winning Move"
      )
    ])
  end

  it "renders a list of tictactoe_moves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Winning Move".to_s, :count => 2
  end
end
