
Given /the following reports exist/ do |reports_table|
  reports_table.hashes.each do |report|
    Report.create report
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.match(/^(?:.*)#{e1}(?:.*)#{e2}(?:.*)$/))
end

Then /I should see a QR code/ do
  expect(page.body).to have_content("img")
end

Then /^I should get a downloaded image with the filename "([^\"]*)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end