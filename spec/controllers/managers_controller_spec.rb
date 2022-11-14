require 'rails_helper'

RSpec.describe ManagersController, type: :controller do
    describe "visiting signup page" do
        it "should succeed" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end
    describe "creating a new manager account" do
        it "with lionmail and valid password should succeed" do
            get :create, {:manager => {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"test123", :password_confirmation=>"test123"}}
            expect(response).to redirect_to(reports_path)
            expect(session[:manager_id]).to eq(1)
        end

        it "with existed account should fail" do
            manager = {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"test123", :password_confirmation=>"test123"}
            Manager.create!(manager)
            get :create, {:manager => {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"test123", :password_confirmation=>"test123"}}
            expect(response).to redirect_to(new_manager_path)
            expect(flash[:notice]).to match(/Account exists. Please try again./)
        end

        it "with invalid email should fail" do
            get :create, {:manager => {:name => "Yanghui Pang", :email => "xxx@columbia.edu", :password=>"test123", :password_confirmation=>"test123"}}
            expect(response).to redirect_to(new_manager_path)
            expect(flash[:notice]).to match(/Please use your lionmail./)
        end

        it "with empty password should fail" do
            get :create, {:manager => {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"", :password_confirmation=>""}}
            expect(response).to redirect_to(new_manager_path)
            expect(flash[:notice]).to match(/Invalid password. Please try again./)
        end

        it "with nonmatched second password input should fail" do
            get :create, {:manager => {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"test123", :password_confirmation=>"test456"}}
            expect(response).to redirect_to(new_manager_path)
            expect(flash[:notice]).to match(/Invalid password. Please try again./)
        end
    end
end
