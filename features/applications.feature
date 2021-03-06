Feature: App Management

Scenario:
    Given I am creating a new app
    When I fill in "App Name" with "My App"
    And I press "Create"
    Then I should be on my apps dashboard
    And I should see "My App" within '#app'
