Feature: Green flag test
    AS a account holder I WANT to login to my account SO THAT I can use my account

  Scenario: Logging in
    Login to the website successfully
    Given that I'm on "https://login.dev.qa-experience.com/login"
    And I enter the correct username - "test@qa-experience.com"
    And I enter the correct password - "Password1"
    When I press the login button
    Then it should log me in successfully
    And show the message, 'Successfully logged in'
