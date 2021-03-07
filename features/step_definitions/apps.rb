Given('I am creating a new app') do
  visit new_app_path
end
Then('I should be on my apps dashboard') do
  assert_current_path(/apps\/\d+/)
end

Given('I have created an app') do
  @app = App.create(name: 'My App')
end

