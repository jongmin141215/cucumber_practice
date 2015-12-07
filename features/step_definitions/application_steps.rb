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

Given(/^I am a registered and logged in user$/) do
  steps %(
    Given I am a registered user
    And I am on the home page
    And I click "Log in" link
    Then I should be on Log in page
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "password"
    And I click "Submit" link
  )
end
