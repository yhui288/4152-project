
Feature: manager handle a repair
  As a manager, I want to operate on the problems

Background: reports in database

  Given the following reports exist:
  |building |area |problemtype | emergencylevel|status|
  |Butler|Restroom 4th FL|Plumbing|Emergent|Uncomplete|
  |Pupin|Lab1034|Electronic|Emergent|Uncomplete|
  |Wien|Room 523|Heat|Ordinary|Uncomplete|
  |Uris|Class Room 301|CVN|Ordinary|Uncomplete|
  |Butler|Computer 52|Internet|Ordinary|Uncomplete|

Scenario: Manager marks an existing issue as complete
	Given I am on the detail page for Report "2"
  Then I follow "Mark as complete"
  Then I should be on the manager page
  Then I should not see "Pupin"

Scenario: Manager edit an existing issue
	Given I am on the edit page for Report "2"
  And I fill in "Building" with "Mudd"
  Then I press "Update Report Info"
  Then I should be on the detail page for Report "2"
  Then I should not see "Pupin"
  Then I should see "Mudd"

Scenario: Manager sorts existing issues by Emergency Level
  Given I am on the manager page
  When I follow "Emergency Level"
  Then I should see "Butler" before "Uris"
  Then I should see "Restroom 4th FL" before "Study Room 523"


