@run
Feature: Verify the list of persons

  Scenario: Verify Han Solo displayed in the list of persons
    Given I expect the "persona" to be "See All Persons"
    When I tap the "persona" widget
    And I pause for 2 seconds
    When I scroll 'ListView' down until "Han Solo" is visible
    Then I expect the "card-13" to be "Han Solo"

  Scenario: Verify complete list of persons
    Given I expect the "persona" to be "See All Persons"
    When I tap the "persona" widget
    And I pause for 2 seconds
    Then I expect the "card-0" to be "Luke Skywalker"
    And I expect the "card-1" to be "C-3PO"
    And I expect the "card-2" to be "R2-D2"
    And I expect the "card-3" to be "Darth Vader"
    And I expect the "card-4" to be "Leia Organa"
    And I expect the "card-5" to be "Owen Lars"
    And I expect the "card-6" to be "Beru Whitesun lars"
    When I scroll 'ListView' down until "R5-D4" is visible
    Then I expect the "card-7" to be "R5-D4"
    When I scroll 'ListView' down until "Biggs Darklighter" is visible
    Then I expect the "card-8" to be "Biggs Darklighter"

  Scenario: More readable: Verify complete list of persons
    Given I expect the "persona" to be "See All Persons"
    When I tap the "persona" widget
    And I pause for 5 seconds
    Then the following list of persons should be displayed
      | Name               |
      | Luke Skywalker     |
      | C-3PO              |
      | Darth Vader        |
      | Leia Organa        |
      | Beru Whitesun lars |
      | R5-D4              |
      | Chewbacca          |
      | Han Solo           |
      | Sly Moore          |
      | Tion Medon         |