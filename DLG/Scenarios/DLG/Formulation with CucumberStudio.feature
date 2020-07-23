@sample @can-be-deleted
Feature: Formulation with CucumberStudio
    Teams practicing BDD use **Cucumber** (or **SpecFlow** or any other variant of Cucumber) feature files to drive the development of their features and thus create piece by piece **an executable documentation** for their products.

    This might be your case, or the goal your team is striving for.

    Maybe you are a developer and you struggle to get feedback about your scenarios from your product owner who has no access to your Git repository?

    Or you are a member of a QA team and you are not comfortable with neither tech or business people tools?

    In any cases, we hope the *Formulation* section of CucumberStudio will grant you with all the tools you need to reduce the daily frictions you meet while building the best applications for your users.

    "**The following scenarios use samples that come from the CucumberOpen documentation tutorial:**"
    https://cucumber.io/docs/guides/10-minute-tutorial/

    "**Want to learn more about feature formulation? Here is our documentation:**"
    https://support.smartbear.com/cucumberstudio/docs/bdd/write-gherkin-scenarios.html

  Scenario: Import a feature file
    You can easily import one or multiple feature files in a folder, by uploading them or directly from a Git repository
    Given a feature file named "is_it_friday_yet.feature" with content:
      """
      Feature: Is it Friday yet?
        Everybody wants to know when it's Friday

        Scenario: Sunday is not Friday
          Given today is Sunday
          When I ask whether it's Friday yet
          Then I should be told "Nope"

        Scenario: Friday is Friday
          Given today is Friday
          When I ask whether it's Friday yet
          Then I should be told "TGIF"
      """
    When "Bob" imports the feature file "is_it_friday_yet.feature" to folder "Calendar"
    Then "Bob" should get a folder "Is it Friday yet?" under the folder "Calendar" with the scenarios:
            | scenario-name |
            | Sunday is not Friday |
            | Friday is Friday |

  Scenario: Rename a step in every scenarios that use it
    While editing a step in a scenario or in a feature background, you can decide whether the modification should impact only the current step or every places where this step is used
    Given two scenarios
      """
        Scenario: Sunday is not Friday
          Given today is Sunday
          When I ask whether it's Friday yet
          Then I should be told "Nope"

        Scenario: Friday is Friday
          Given today is Friday
          When I ask whether it's Friday yet
          Then I should be told "TGIF"
      """
    When "Bob" renames globally the step "Then I should be told "response"" by "Then I should get the answer "response""
    Then the scenarios using step "Then I should be told "response"" should be:
      """
        Scenario: Sunday is not Friday
          Given today is Sunday
          When I ask whether it's Friday yet
          Then I should get the answer "Nope"

        Scenario: Friday is Friday
          Given today is Friday
          When I ask whether it's Friday yet
          Then I should get the answer "TGIF"
      """

  Scenario: Use parameters in a step
    It is possible to collapse similar steps into a single one by using **parameters**
    It makes future modifications on this step easier, for example to modify your business language, and accelerates automation of your features as there is only one step to automate instead of multiple ones.
    Given two scenarios
      """
      Scenario: Sunday isn't Friday
        Given today is Sunday
        When I ask whether it's Friday yet
        Then I should be told "Nope"

      Scenario: Friday is Friday
        Given today is Friday
        When I ask whether it's Friday yet
        Then I should be told "TGIF"
      """
    When Bob creates a new step "today is "day""
    And changes the two scenarios as
      """
      Scenario: Sunday isn't Friday
        Given today is "Sunday"
        When I ask whether it's Friday yet
        Then I should be told "Nope"

      Scenario: Friday is Friday
        Given today is "Friday"
        When I ask whether it's Friday yet
        Then I should be told "TGIF"
      """
    Then Bob has only the step "today is "day"" to maintain instead of these two
            | step |
            | today is Sunday |
            | today is Friday |

  Scenario: Scenario with multiple examples
    You can collapse multiple similar scenarios into one using **Datatable** and **parameters** in steps
    Given two scenarios
      """
      Scenario: Sunday isn't Friday
          Given today is Sunday
          When I ask whether it's Friday yet
          Then I should be told "Nope"

        Scenario: Friday is Friday
          Given today is Friday
          When I ask whether it's Friday yet
          Then I should be told "TGIF"
      """
    When "Bob" adds a new scenario "Today is or is not Friday" with the content
      """
      Given today is "=day"
      When I ask whether it's Friday yet
      Then I should be told "=answer"
      """
    And the datatable
             | day            | answer |
             | Friday         | TGIF |
             | Sunday         | Nope |
             | anything else! | Nope |
    Then "Bob" has a scenario "Today is or is not Friday" to describe the same behaviour than these scenarios
            | scenario name |
            | Sunday isn't Friday |
            | Friday is Friday |

  Scenario: Download feature file
    Once your feature is ready, you can export it as a **.feature** file so it can be automated
    Given a folder "Is it Friday yet?" with the scenarios:
            | scenario-name |
            | Sunday is not Friday |
            | Friday is Friday |
    When "Bob" download folder "Is it Friday yet?"
    Then "Bob" should get a feature file "is_it_friday_yet.feature" with content:
      """
      Feature: Is it Friday yet?
        Everybody wants to know when it's Friday

        Scenario: Sunday is not Friday
          Given today is Sunday
          When I ask whether it's Friday yet
          Then I should be told "Nope"

        Scenario: Friday is Friday
          Given today is Friday
          When I ask whether it's Friday yet
          Then I should be told "TGIF"
      """
