Feature: Google
  In order to test if Google Search is working
  As a visitor
  I want to access the page

  Scenario: Visit Google Search Page
    Given I visit 'https://www.google.com'
    When I search for 'Github'
    Then the result is shown