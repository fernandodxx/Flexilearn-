require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  let(:lesson) {
    Lesson.create!(
      title: "MyString",
      content: "MyText",
      trail: nil
    )
  }

  before(:each) do
    assign(:lesson, lesson)
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(lesson), "post" do
      assert_select "input[name=?]", "lesson[title]"

      assert_select "textarea[name=?]", "lesson[content]"

      assert_select "input[name=?]", "lesson[trail_id]"
    end
  end
end
