class SessionsController < ApplicationController
    
    def create
        @manager = Manager.find_by(email: params[:manager][:email])

        if !!@manager && @manager.authenticate(params[:manager][:password])
            session[:manager_id] = @manager.id
            redirect_to reports_path(:problem_type => {:problem_type => "All"})
        else
            message = "Invalid email/password"
            redirect_to login_path, notice: message
        end
    end

    def destroy
        session[:manager_id] = nil

        redirect_to root_path
    end
end
