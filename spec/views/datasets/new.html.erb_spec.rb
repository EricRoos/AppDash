require 'rails_helper'

RSpec.describe "datasets/new", type: :view do
  before(:each) do
    assign(:dataset, Dataset.new(
      app: nil,
      name: "MyString"
    ))
  end

  it "renders new dataset form" do
    render

    assert_select "form[action=?][method=?]", datasets_path, "post" do

      assert_select "input[name=?]", "dataset[app_id]"

      assert_select "input[name=?]", "dataset[name]"
    end
  end
end
