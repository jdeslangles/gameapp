require 'spec_helper'

describe "tictactoe_moves/show" do
  before(:each) do
    @tictactoe_move = assign(:tictactoe_move, stub_model(TictactoeMove,
      :game_id => 1,
      :player_id => 2,
      :move_square => 3,
      :symbol => "Symbol",
      :winning_move => "Winning Move"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Symbol/)
    rendered.should match(/Winning Move/)
  end
end
