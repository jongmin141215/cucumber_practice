Feature: As an employee of an education institute
  In order to access all features of the application
  I would like to be given access by creating an administration account

Scenario: Create an account
  Given I am on the home page
  And I click "Register" link
  Then I should be on the Registration page
  And I fill in "Name" with "Jongmin"
  And I fill in "Email" with "test@test.com"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password"
  And I click "Create" link
  Then a new "User" should be created
  And I should see "Your account has been created, Jongmin"

Scenario: Log in to the application
  Given I am a registered user
  And I am on the home page
  And I click "Log in" link
  Then I should be on Log in page
  And I fill in "Email" with "test@test.com"
  And I fill in "Password" with "password"
  And I click "Submit" link
  Then I should be on the home page
  And I should see "Successfully logged in Jongmin"
  And I should not see "Register"

Scenario: Log out from the application
