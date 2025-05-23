require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      title: "MyString",
      content: "MyText",
      trail: nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do
      assert_select "input[name=?]", "lesson[title]"

      assert_select "textarea[name=?]", "lesson[content]"

      assert_select "input[name=?]", "lesson[trail_id]"
    end
  end
end
