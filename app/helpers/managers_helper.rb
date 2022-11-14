module ManagersHelper
    def self.lionmail?(email)
        email.match?(/^[a-z][a-z][0-9][0-9][0-9][0-9]@columbia.edu$/x) or email.match?(/^[a-z][a-z][a-z][0-9][0-9][0-9][0-9]@columbia.edu$/x)
    end
end
