require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :last_name => "Last Name",
      :password_digest => "Password Digest",
      :username => "Username",
      :email => "Email",
      :bio => "MyText",
      :user_picture => "User Picture",
      :user_gender => "User Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Password Digest/)
    rendered.should match(/Username/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/User Picture/)
    rendered.should match(/User Gender/)
  end
end
