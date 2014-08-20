Feature: Location

  Scenario: Location creation
    When I go to the "new location" page
    And I fill in "location name" with "Raw mill"
    And I press "Create Location"
    Then I should see "Location was successfully created"
    And I should see "Raw mill"
