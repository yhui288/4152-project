# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    # when /^the (ColumbiaRepairReportPlatform )?home\s?page$/ then '/reports'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    when /^the home page$/ then root_path
    when /^the submit report page$/ then new_report_path
    when /^the manager page$/ then reports_path
    when /^the QR code generation page$/ then qrcode_path
    when /^the reports page$/ then reports_path
    when /^the detail page for Report "(.*)"$/ then report_path(Report.find($1))
    when /^the edit page for Report "(.*)"$/ then edit_report_path(Report.find($1))
    when /^the submit report page of "(.*)" in "(.*)"$/ then new_report_path(:report => {:building => $2, :area => $1})
    when /^the login page$/ then login_path

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)