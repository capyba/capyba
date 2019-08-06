Feature: Google
  In order to test if Google Search is working
  As a visitor
  The user wants to access the Google page search

  @search
  Scenario: Visit Google Search Page
    Given the browser is at the Google search page
    When the user searches for 'Github'
    Then web page links for 'Github' are shown

  @login
  Scenario: Login Google
    Given the browser is at the Google search page
    When the user enters its credentials
    Then the login is done