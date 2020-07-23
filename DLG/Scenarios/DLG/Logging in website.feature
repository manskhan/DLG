Feature: Logging in website
    AS a bank account holder I WANT to login to my bank account SO THAT I can transfer money

  Scenario: 1 Logging onto online banking
    Given that my bank account exists
    And the online banking website is working
    When the account holder uses his internet banking user id to login
    Then it should show them their bank account
    And then timeout if there is no activity for 5 minutes

  Scenario: 2 Pay someone a £100
    Given that there is £100>  in the account including OD facility amount
    And the Receiver’s account details are valid
    When the account holder confirms the transfer of £100
    Then transaction is logged
    And the account has £100 subtracted
    And the new balance is shown

  Scenario: 3 Logging out
    Given that the account holder is logged in
    When the account holder presses logout
    Then the account holder is logged out
    And a successfully logged out message is displayed
    And the account holder is back on the internet banking login page
