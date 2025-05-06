require 'rails_helper'

RSpec.describe "trails/index", type: :view do
  before(:each) do
    assign(:trails, [
      Trail.create!(
        title: "Title",
        description: "MyText",
        user: nil
      ),
      Trail.create!(
        title: "Title",
        description: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of trails" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
