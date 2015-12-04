And(/^I am logged in as an administrator$/) do
  log_in_admin
  expect(WorkshopApp.admin_logged_in).to eq true
end

And(/^I click "([^"]*)" link$/) do |element|
  click_on element
end

Then(/^a new "([^"]*)" should be created$/) do |model|
  expect(Object.const_get(model).count).to eq 1
end

Given(/^I am a registered user$/) do
  steps %(
    Given I am on the home page
    And I click "Register" link
    Then I should be on the Registration page
    And I fill in "Name" with "Jongmin"
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click "Create" link
  )
end