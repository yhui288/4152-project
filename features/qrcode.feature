Feature: create a QRcode
    I want to create a QR code for a place

Scenario: Generate a QR code for a facility
  Given I am on the manager page
    Then I follow "Generate QR Code"
    Then I should be on the QR code generation page
    Then I fill in "Building" with "Mudd"
      And I fill in "Area" with "1st floor restroom"
      And I press "Generate"
    Then I should get a downloaded image with the filename "mudd_1st floor restroom_qrcode.png"