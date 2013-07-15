require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :game_type_id => 1,
        :game_result => "Game Result"
      ),
      stub_model(Game,
        :game_type_id => 1,
        :game_result => "Game Result"
      )
    ])
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Game Result".to_s, :count => 2
  end
end
