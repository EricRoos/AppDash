When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I press {string}') do |button_text|
  click_on button_text
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Then('I should see {string} within {string}') do |text, container|
  within container do
    step %{I should see '#{text}'}
  end
end

Given('I am creating a new data set') do
  visit "/apps/#{@app.id}/datasets/new"
end

