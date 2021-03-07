require 'rails_helper'

RSpec.feature "AppManagements", type: :feature do
  scenario 'creating an app' do
    visit new_app_path
    fill_in 'App Name', with: 'My App'
    click_on 'Create'
    expect(page).to have_content('App was successfully created.')
  end
end
