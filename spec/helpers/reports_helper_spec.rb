require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ManagersHelper. For example:
#
# describe ManagersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReportsHelper, type: :helper do
  describe "uni verification" do
    it "valid uni" do
      expect(ReportsHelper.valid_uni?("sy3006")).to be true
    end

    it "invalid email" do
        expect(ReportsHelper.valid_uni?("abc123")).to be false
    end
  end
end
