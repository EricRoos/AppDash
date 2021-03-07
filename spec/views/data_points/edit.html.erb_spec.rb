require 'rails_helper'

RSpec.describe "data_points/edit", type: :view do
  before(:each) do
    @data_point = assign(:data_point, DataPoint.create!(
      dataset: nil,
      name: "MyString",
      type: ""
    ))
  end

  it "renders the edit data_point form" do
    render

    assert_select "form[action=?][method=?]", data_point_path(@data_point), "post" do

      assert_select "input[name=?]", "data_point[dataset_id]"

      assert_select "input[name=?]", "data_point[name]"

      assert_select "input[name=?]", "data_point[type]"
    end
  end
end
