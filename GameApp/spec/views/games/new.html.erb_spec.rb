require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :game_type_id => 1,
      :game_result => "MyString"
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path, :method => "post" do
      assert_select "input#game_game_type_id", :name => "game[game_type_id]"
      assert_select "input#game_game_result", :name => "game[game_result]"
    end
  end
end
