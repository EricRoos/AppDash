require 'rails_helper'

RSpec.describe "data_points/show", type: :view do
  before(:each) do
    @data_point = assign(:data_point, DataPoint.create!(
      dataset: nil,
      name: "Name",
      type: "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
  end
end
