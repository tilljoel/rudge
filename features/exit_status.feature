Feature: exit status
  In order take action on the exit status
  As a developer who uses this gem in CI or commit hooks
  I want a correct exit status to act on

  Scenario: exit status of 0
    When I run `rudge -h`
    Then the exit status should be 0
  Scenario: non-zero exit status
    When I run `rudge --invalid`
    Then the exit status should be 1
