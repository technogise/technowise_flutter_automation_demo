Feature: Verify the list of persons

  Scenario: See All Persons should display the complete list of persons
    Given I expect the "persona" to be "See All Persons"
    When I tap the "persona" widget
    And I pause for 2 seconds
    Then I expect the "card-0" to be "Luke Skywalker"
    And I expect the "card-1" to be "C-3PO"
    And I expect the "card-2" to be "R2-D21"