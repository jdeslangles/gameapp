require 'spec_helper'

describe "playings/show" do
  before(:each) do
    @playing = assign(:playing, stub_model(Playing,
      :user_id => 1,
      :game_id => 2,
      :player_position => 3,
      :finish_position => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
