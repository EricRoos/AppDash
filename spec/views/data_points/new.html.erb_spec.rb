require 'rails_helper'

RSpec.describe "data_points/new", type: :view do
  before(:each) do
    assign(:data_point, DataPoint.new(
      dataset: nil,
      name: "MyString",
      type: ""
    ))
  end

  it "renders new data_point form" do
    render

    assert_select "form[action=?][method=?]", data_points_path, "post" do

      assert_select "input[name=?]", "data_point[dataset_id]"

      assert_select "input[name=?]", "data_point[name]"

      assert_select "input[name=?]", "data_point[type]"
    end
  end
end
