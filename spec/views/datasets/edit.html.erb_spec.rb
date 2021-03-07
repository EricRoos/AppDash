require 'rails_helper'

RSpec.describe "datasets/edit", type: :view do
  before(:each) do
    @dataset = assign(:dataset, Dataset.create!(
      app: nil,
      name: "MyString"
    ))
  end

  it "renders the edit dataset form" do
    render

    assert_select "form[action=?][method=?]", dataset_path(@dataset), "post" do

      assert_select "input[name=?]", "dataset[app_id]"

      assert_select "input[name=?]", "dataset[name]"
    end
  end
end
