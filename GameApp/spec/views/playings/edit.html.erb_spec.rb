require 'spec_helper'

describe "playings/edit" do
  before(:each) do
    @playing = assign(:playing, stub_model(Playing,
      :user_id => 1,
      :game_id => 1,
      :player_position => 1,
      :finish_position => 1
    ))
  end

  it "renders the edit playing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => playings_path(@playing), :method => "post" do
      assert_select "input#playing_user_id", :name => "playing[user_id]"
      assert_select "input#playing_game_id", :name => "playing[game_id]"
      assert_select "input#playing_player_position", :name => "playing[player_position]"
      assert_select "input#playing_finish_position", :name => "playing[finish_position]"
    end
  end
end
