require 'spec_helper'

describe "playings/index" do
  before(:each) do
    assign(:playings, [
      stub_model(Playing,
        :user_id => 1,
        :game_id => 2,
        :player_position => 3,
        :finish_position => 4
      ),
      stub_model(Playing,
        :user_id => 1,
        :game_id => 2,
        :player_position => 3,
        :finish_position => 4
      )
    ])
  end

  it "renders a list of playings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
