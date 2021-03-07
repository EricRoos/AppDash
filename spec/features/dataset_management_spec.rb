require 'rails_helper'

RSpec.feature "DatasetManagements", type: :feature do
  scenario 'creating a dataset', js: true do
    @app = App.create(name: 'foo')
    visit new_app_dataset_path(@app)
    fill_in 'Dataset Name', with: 'Foo'
    click_on 'Create'
    #expect(page).to have_content('Dataset was successfully created.')
    within '#datasets' do
      expect(page).to have_content('Foo')
    end
  end
end
