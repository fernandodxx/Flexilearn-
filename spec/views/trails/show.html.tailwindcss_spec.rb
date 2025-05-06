require 'rails_helper'

RSpec.describe "trails/show", type: :view do
  before(:each) do
    assign(:trail, Trail.create!(
      title: "Title",
      description: "MyText",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
