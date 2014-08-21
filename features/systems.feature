Feature: System

 Scenario: System creation
    Given a "Raw Mill" location exists
    When I go to the "new system" page
    And I fill in "system name" with "Conveying"
    And I select "Raw Mill" from "system location id"
    And I press "Create System"
    Then I should see "System was successfully created"
    And I should see "Conveying"
