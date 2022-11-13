module ManagersHelper
    def self.lionmail?(email)
        email.include?("@columbia.edu")
    end
end
