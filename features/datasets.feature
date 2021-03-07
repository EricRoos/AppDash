Feature: Data Set Management

  Scenario:
    Given I have created an app
    And I am creating a new data set
    When I fill in "Dataset Name" with "View Data"
    And I press "Create"
    Then I should be on my apps dashboard
    And I should see "View Data" within '#datasets'
