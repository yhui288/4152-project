
Feature: manager handle a repair
  As a manager, I want to operate on the problems

Background: reports and managers in database

  Given the following reports exist:
  |building |area |problemtype | emergencylevel |status |
  |Butler|Restroom 4th FL|Plumbing|Urgent|Uncompleted|
  |Pupin|Lab1034|Electronic|Urgent|Uncompleted|
  |Wien|Room 523|Heat|Ordinary|Uncompleted|
  |Uris|Class Room 301|CVN|Ordinary|Completed|
  |Butler|Computer 52|Internet|Ordinary|Uncompleted|

  Given the following managers exist:
  |email |password |name |
  |yp2604@columbia.edu|test123|Yanghui Pang|

Scenario: Manager marks an existing issue as complete
  When I login with email "yp2604@columbia.edu" and password "test123"
	Given I am on the detail page for Report "2"
  Then I follow "Mark as Completed"
  Then I should be on the detail page for Report "2"
  Then I should see "Marked as complete successful"
  Then I follow "Back to Report List"
  Then I should not see "pupin"

Scenario: Manager edit an existing issue
  When I login with email "yp2604@columbia.edu" and password "test123"
	Given I am on the edit page for Report "2"
  And I fill in "Building" with "Mudd"
  Then I press "Update Report Info"
  Then I should be on the detail page for Report "2"
  Then I should not see "Pupin"
  Then I should see "Mudd"

Scenario: Manager see all reports
  When I login with email "yp2604@columbia.edu" and password "test123"
  Given I am on the manager page
  When I check the "Show Completed Reports" checkbox
  When I press "Filter"
  Then I should see "Uris"

Scenario: Manager filters issues by Emergency Level
  When I login with email "yp2604@columbia.edu" and password "test123"
  Given I am on the manager page
  When I check the "Show Urgent Reports Only" checkbox
  When I press "Filter"
  Then I should not see "Wien"


Scenario: Manager filters issues by Problem Type
  When I login with email "yp2604@columbia.edu" and password "test123"
  Given I am on the manager page
  When I select "Laundry" from "Problem Type"
  When I press "Filter"
  Then I should not see "Wien"


Scenario: Manager marks an existing issue as complete
  When I login with email "yp2604@columbia.edu" and password "test123"
	Given I am on the detail page for Report "2"
  And I fill in "comment_cmt" with "this one is hard"
  Then I press "Add Comment"
  Then I should be on the detail page for Report "2"
  Then I should see "this one is hard"
  And I fill in "comment_cmt" with ""
  Then I press "Add Comment"
  Then I should be on the detail page for Report "2"
  Then I should see "Cannot add a blank comment"


Scenario: Manager plays with login
  When I login with email "yp2604@columbia.edu" and password "wrongpwd"
  Then I should see "Invalid email/password"
  When I login with email "yp2604@columbia.edu" and password "test123"
  Then I follow "Log Out"
  Then I should be on the home page

Scenario: Manager register
  When I am on the login page
  And I follow "Create Account"
  Then I fill in "Name" with "Alan"
  Then I fill in "Email" with "sy3006@columbia.edu"
  Then I fill in "Password" with "asd123"
  Then I fill in "Confirm Password" with "asd123"
  Then I press "Sign Up"
  Then I should be on the manager page


Scenario: Manager failed to register(1)
  When I am on the login page
  And I follow "Create Account"
  Then I fill in "Name" with "Alan"
  Then I fill in "Email" with "sy3006@gmail.edu"
  Then I fill in "Password" with "asd123"
  Then I fill in "Confirm Password" with "asd123"
  Then I press "Sign Up"
  Then I should see "Please use your lionmail."

Scenario: Manager failed to register(2)
  When I am on the login page
  And I follow "Create Account"
  Then I fill in "Name" with "Alan"
  Then I fill in "Email" with "yp2604@columbia.edu"
  Then I fill in "Password" with "asd123"
  Then I fill in "Confirm Password" with "asd123"
  Then I press "Sign Up"
  Then I should see "Account exists. Please try again."

Scenario: Manager failed to register(3)
  When I am on the login page
  And I follow "Create Account"
  Then I fill in "Name" with "Alan"
  Then I fill in "Email" with "sy3006@columbia.edu"
  Then I fill in "Password" with ""
  Then I fill in "Confirm Password" with "asd"
  Then I press "Sign Up"
  Then I should see "Invalid password. Please try again."