require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    describe "managers login" do
        before do
            manager = {:name => "Yanghui Pang", :email => "yp2604@columbia.edu", :password=>"test123", :password_confirmation=>"test123"}
            Manager.create!(manager)
        end
        it "should succeed with correct email and password" do
            post :create, {:manager => {:email => "yp2604@columbia.edu", :password => "test123"}}
            expect(response).to redirect_to reports_path
            expect(session[:manager_id]).to eq(1)
        end
        it "should fail with incorrect email" do
            post :create, {:manager => {:email => "yp2605@columbia.edu", :password => "test123"}}
            expect(response).to redirect_to login_path
            expect(flash[:notice]).to match(/Invalid email\/password/)
        end
        it "should fail with incorrect password" do
            post :create, {:manager => {:email => "yp2604@columbia.edu", :password => "test456"}}
            expect(response).to redirect_to login_path
            expect(flash[:notice]).to match(/Invalid email\/password/)
        end
        it "can logout" do
            post :create, {:manager => {:email => "yp2604@columbia.edu", :password => "test123"}}
            get :destroy
            expect(response).to redirect_to root_path
            expect(session[:manager_id]).to eq(nil)
        end
    end
end
