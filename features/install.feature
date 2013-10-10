Feature: Install
  In order to use envy
  As a user
  I want to run install

  Scenario: I download envy
    Given I download envy
    Then a directory named "envy" should exist

  Scenario: Install creates ~/.envy
    Given I download envy
    When I run `envy/bin/install.sh`
    Then a home directory named ".envy/" should exist

  Scenario: Install creates /usr/local/bin/envy 
    Given I download envy
    When I run `envy/bin/install.sh`
    Then a file named "/usr/local/bin/envy" should exist

