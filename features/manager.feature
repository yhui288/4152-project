
Feature: manager handle a repair
  As a manager, I want to operate on the problems

Background: reports in database

  Given the following reports exist:
  |building |area |problemtype | emergencylevel|status|
  |Butler|Restroom 4th FL|Plumbing|Urgent|Uncompleted|
  |Pupin|Lab1034|Electronic|Urgent|Uncompleted|
  |Wien|Room 523|Heat|Ordinary|Uncompleted|
  |Uris|Class Room 301|CVN|Ordinary|Completed|
  |Butler|Computer 52|Internet|Ordinary|Uncompleted|

Scenario: Manager marks an existing issue as complete
	Given I am on the detail page for Report "2"
  Then I follow "Mark as complete"
  Then I should be on the detail page for Report "2"
  Then I should see "Marked as complete successful"
  Then I follow "Back to report list"
  Then I should not see "pupin"

Scenario: Manager edit an existing issue
	Given I am on the edit page for Report "2"
  And I fill in "Building" with "Mudd"
  Then I press "Update Report Info"
  Then I should be on the detail page for Report "2"
  Then I should not see "Pupin"
  Then I should see "Mudd"

Scenario: Manager see all reports
  Given I am on the manager page
  When I check the "Show Completed Reports" checkbox
  When I press "Filter"
  Then I should see "Uris"

Scenario: Manager filters issues by Emergency Level
  Given I am on the manager page
  When I check the "Show Urgent Reports Only" checkbox
  When I press "Filter"
  Then I should not see "Wien"


