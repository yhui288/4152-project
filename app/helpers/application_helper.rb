module ApplicationHelper
    def logged_in?
        session[:manager_id]
    end
end
