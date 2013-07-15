require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :game_type_id => 1,
      :game_result => "MyString"
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path(@game), :method => "post" do
      assert_select "input#game_game_type_id", :name => "game[game_type_id]"
      assert_select "input#game_game_result", :name => "game[game_result]"
    end
  end
end
