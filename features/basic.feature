Background: reports in database

  Given the following reports exist:
  # | title        | rating | director     | release_date |
  # | Star Wars    | PG     | George Lucas |   1977-05-25 |
  # | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  # | Alien        | R      |              |   1979-05-25 |
  # | THX-1138     | R      | George Lucas |   1971-03-11 |



Scenario: User reports a new issue
  Given I am on the report page
	Then I check "type-heat"
	Then I check "level-emergent"
    And  I fill in "Building" with "Mudd"
    And  I fill in "Room Number" with "Lounge"
    And  I fill in "Leave your UNI" with "dh3071"
    And  I press "Publish"
	Then I should be on home page
	Then I should see "successfully published"

Scenario: User reports an existing issue
	Given I am on the report page
	Then I check "type-heat"
	Then I check "level-emergent"
    And  I fill in "Building" with "Mudd"
    And  I fill in "Room Number" with "Lounge"
    And  I fill in "Leave your UNI" with "dh3071"
 	  And  I press "Publish"
  Then I should be on home page
  Then I should see "Already been published"

Scenario: Manager marks an existing issue as complete
	Given I am on the manager page
	Then I click complete for report 3
  Then  I should be on the home page

Scenario: Manager sorts existing  issues by Emergency Level
  Given I am on the manager page
  When I follow "Emergency Level"
  Then I should see "Butler" before "Uris"
  Then I should see "Restroom 4th FL" before "Study Room 523"
             
Scenario: Generate a QR code for a facility
  Given I am on the manager page
    Then I follow "Generate QR code"
    Then I should be on the QR code generation page
    Then I fill in "Building" with "Mudd"
      And I fill in "Area" with "1st floor restroom"
      And I press "Generate!"
    Then I should see a QR code

