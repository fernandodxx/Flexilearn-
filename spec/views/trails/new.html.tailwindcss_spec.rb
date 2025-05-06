require 'rails_helper'

RSpec.describe "trails/new", type: :view do
  before(:each) do
    assign(:trail, Trail.new(
      title: "MyString",
      description: "MyText",
      user: nil
    ))
  end

  it "renders new trail form" do
    render

    assert_select "form[action=?][method=?]", trails_path, "post" do
      assert_select "input[name=?]", "trail[title]"

      assert_select "textarea[name=?]", "trail[description]"

      assert_select "input[name=?]", "trail[user_id]"
    end
  end
end
