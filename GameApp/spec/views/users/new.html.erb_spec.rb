require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :last_name => "MyString",
      :password_digest => "MyString",
      :username => "MyString",
      :email => "MyString",
      :bio => "MyText",
      :user_picture => "MyString",
      :user_gender => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_first_name", :name => "user[first_name]"
      assert_select "input#user_last_name", :name => "user[last_name]"
      assert_select "input#user_password_digest", :name => "user[password_digest]"
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "textarea#user_bio", :name => "user[bio]"
      assert_select "input#user_user_picture", :name => "user[user_picture]"
      assert_select "input#user_user_gender", :name => "user[user_gender]"
    end
  end
end
