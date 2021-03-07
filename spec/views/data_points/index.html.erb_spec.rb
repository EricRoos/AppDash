require 'rails_helper'

RSpec.describe "data_points/index", type: :view do
  before(:each) do
    assign(:data_points, [
      DataPoint.create!(
        dataset: nil,
        name: "Name",
        type: "Type"
      ),
      DataPoint.create!(
        dataset: nil,
        name: "Name",
        type: "Type"
      )
    ])
  end

  it "renders a list of data_points" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
  end
end
