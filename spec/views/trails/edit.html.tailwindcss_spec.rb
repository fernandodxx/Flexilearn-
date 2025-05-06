require 'rails_helper'

RSpec.describe "trails/edit", type: :view do
  let(:trail) {
    Trail.create!(
      title: "MyString",
      description: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:trail, trail)
  end

  it "renders the edit trail form" do
    render

    assert_select "form[action=?][method=?]", trail_path(trail), "post" do
      assert_select "input[name=?]", "trail[title]"

      assert_select "textarea[name=?]", "trail[description]"

      assert_select "input[name=?]", "trail[user_id]"
    end
  end
end
