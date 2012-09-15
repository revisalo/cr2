Feature: student's basic data management

Scenario: Unsuccessful signin
    Given a user visits the pensums
    When he submits invalid signin information
    Then he should see an error message
