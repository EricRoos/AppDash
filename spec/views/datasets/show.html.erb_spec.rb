require 'rails_helper'

RSpec.describe "datasets/show", type: :view do
  before(:each) do
    @dataset = assign(:dataset, Dataset.create!(
      app: nil,
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
