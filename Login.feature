Feature: Search
  As a online customer
  I want to login
  and place a bet


  Scenario: Navigate to William hill website and login
    When I navigate to WilliamHill website
    Then WilliamHill Sports page should be displayed
    And I click on login button
    And I enter username and password
    And I place a bet



