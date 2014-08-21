Feature: Equipment Type

  Scenario: Equipment Type creation
    When I go to the "new equipment type" page
    And I fill in "equipment type name" with "Conveying"
    And I press "Create Equipment type"
    Then I should see "Equipment type was successfully created"
    And I should see "Conveying"
