Feature: user report a repair
  As a user, I want to report a problem I see

Background: reports in database

  Given the following reports exist:
  |building |area |problemtype | emergencylevel|status|
  |Butler|Restroom 4th FL|Plumbing|Emergent|Uncomplete|
  |Pupin|Lab1034|Electronic|Emergent|Uncomplete|
  |Wien|Room 523|Heat|Ordinary|Uncomplete|
  |Uris|Class Room 301|CVN|Ordinary|Uncomplete|
  |Butler|Computer 52|Internet|Ordinary|Uncomplete|


Scenario: User reports a new issue
  Given I am on the submit report page
  When I select "Laundry" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Mudd"
    And I fill in "Area" with "Lounge"
    And I fill in "Please enter your UNI" with "dh3071"
    And I press "Publish"
  Then I should be on the reports page
  Then I should see "successfully published"

Scenario: User reports a new issue with invalid uni
  Given I am on the submit report page
  When I select "Electronic" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Mudd"
    And I fill in "Area" with "Lounge"
    And I fill in "Please enter your UNI" with "xxx"
    And I press "Publish"
 Then I should be on the reports page
 Then I should see "invalid UNI"

Scenario: User reports an existing issue
  Given I am on the submit report page
  When I select "Plumbing" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Building" with "Butler"
    And I fill in "Area" with "Restroom 4th FL"
    And I fill in "Please enter your UNI" with "dh3071"
    And I press "Publish"
  Then I should be on the reports page
  Then I should see "Already been published"

Scenario: User reports a new issue by scanning QR code
  Given I am on the submit report page of "1st floor restroom" in "Mudd"
  Then the "Location: Building" field should contain "Mudd"
    And the "Location: Area" field should contain "1st floor restroom"
  When I select "Other" from "Problem Type"
  When I select "Urgent" from "Emergency Level"
    And I fill in "Please enter your UNI" with "dh3071"
    And I press "Publish"
   Then I should be on the reports page
 Then I should see "successfully published"