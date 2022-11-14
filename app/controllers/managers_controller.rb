class ManagersController < ApplicationController

    def new
        @manager = Manager.new
    end

    def create
        # check if email is lionmail
        if !ManagersHelper.lionmail?(params[:manager][:email])
            message = "Please use your lionmail."
            return redirect_to new_manager_path, notice: message
        end
        # check if accout exists
        @manager = Manager.find_by(email: params[:manager][:email])
        if @manager
            message = "Account exists. Please try again."
            return redirect_to new_manager_path, notice: message
        end
        # check if passwords are valid and match
        @manager = Manager.new(manager_params)
        if @manager.save
            session[:manager_id] = @manager.id
            return redirect_to reports_path
        else
            message = "Invalid password. Please try again."
            return redirect_to new_manager_path, notice: message
        end
    end

    def show
        # @manager = Manager.find(params[:manager_id])
    end

    private

    def manager_params
        params.require(:manager).permit(:name, :email, :password, :password_confirmation)
    end
end
