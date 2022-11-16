require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "users can submit reports" do
    it "reports with valid parameters" do
      get :create, {:report => {:uni => 'jg4403',:building => 'Pupin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Urgent',
                                :status => 'Uncompleted'}}
      expect(flash[:notice]).to match(/successfully published/)
      expect(response).to redirect_to root_path
      Report.find_by(:building => 'Pupin').destroy
    end


    it "reports with invalid uni" do
      get :create, {:report => {:uni => '!!!',:building => 'Pupin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Urgent',
                                :status => 'Uncompleted'}}
      expect(flash[:notice]).to match(/invalid UNI/)
      expect(response).to redirect_to root_path
    end

    it "reports with dupliacted examples" do
      get :create, {:report => {:uni => 'jg4403',:building => 'Pupin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Urgent',
                                :status => 'Uncompleted'}}
      expect(flash[:notice]).to match(/successfully published/)
      expect(response).to redirect_to root_path

      get :create, {:report => {:uni => 'jg4403',:building => 'Pupin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Urgent',
                                :status => 'Uncompleted'}}
      expect(flash[:notice]).to match(/Already been published/)
      expect(response).to redirect_to root_path
    end
  end

  describe "update reports" do
    it "update report valid attributes" do
      report = Report.create(:building => 'test',:area => 'test',
                                :problemtype=> 'Electronic', :emergencylevel => 'Urgent',
                                :status => 'Uncompleted')
      get :edit, {:id => report.id}
      expect(response).to have_http_status(:success)
      get :update, {:id => report.id, :report => {:building => 'new test'}}
      expect(Report.where(:building => 'new test')).not_to be_empty
      expect(Report.where(:building => 'test')).to be_empty
      expect(response).to redirect_to report_path(report)
      # get :destroy, {:id => report.id}
    end
  end

  describe "users can submit reports by scanning QR code" do
    it "gives a form with prefilled location" do
      get :new, {:report => {:building => 'Mudd', :area => '1st floor restroom'}}
      expect(response).to have_http_status(:success)
      expect(assigns(:prefilled_building)).to eq 'Mudd'
      expect(assigns(:prefilled_area)).to eq '1st floor restroom'
    end
  end

  describe "More Info" do
    before do
      manager = {:name => "Alan", :email => "sy3006@columbia.edu", :password=>"abc123", :password_confirmation=>"abc123"}
      Manager.create!(manager)
    end

    it "gives the details of a report" do
      get :create, {:report => {:uni => 'jg4403',:building => 'Pupin',:area => 'Lab1034',
                                :problemtype=> 'Heat', :emergencylevel => 'Ordinary'}}
      expect(flash[:notice]).to match(/successfully published/)
      get :show, {:id => 1}, {:manager_id => 1}
      expect(response).to have_http_status(:success)
      expect(assigns(:report)['building']).to eq 'Pupin'
    end
  end

  describe "filter by emergency level" do
    before do
      reports = [
        {:uni => 'yp2604', :building => 'Mudd', :area => '2st floor classroom', :problemtype => 'Electronic', :emergencylevel => 'Urgent', :status => 'Completed'},
        {:uni => 'yp2604', :building => 'Mudd', :area => '1st floor classroom', :problemtype => 'Electronic', :emergencylevel => 'Urgent', :status => 'Uncompleted'},
        {:uni => 'yp2604', :building => 'Mudd', :area => '2st floor restroom', :problemtype => 'Floor', :emergencylevel => 'Ordinary', :status => 'Completed'},
        {:uni => 'yp2604', :building => 'Mudd', :area => '1st floor restroom', :problemtype => 'Floor', :emergencylevel => 'Ordinary', :status => 'Uncompleted'}
      ]
      reports.each do |report|
        get :create, {:report => report}
      end
      manager = {:name => "Alan", :email => "sy3006@columbia.edu", :password=>"abc123", :password_confirmation=>"abc123"}
      Manager.create!(manager)
    end

    it "filter urgent reports before normal reports" do
      get :index, {:emer_only => "1"}, {:manager_id => 1}
      assigns(:reports).each do |report|
        expect(report['emergencylevel']).to eq 'Urgent'
      end
      get :index, {:emer_only => "0"}, {:manager_id => 1}
      expect(response).to have_http_status(:success)
    end

    it "see completed" do
      get :index, {}, {:manager_id => 1}
      assigns(:reports).each do |report|
        expect(report['status']).to eq 'Uncompleted'
      end
    end

    it "see all" do
      get :index,{:show_complete => "1"}, {:manager_id => 1}
      expect(assigns(:reports).length == 4)
    end

    it "see Electronic" do
      get :index,{:problem_type => {:problem_type => "Electronic"}}, {:manager_id => 1}
      assigns(:reports).each do |report|
        expect(report['problemtype']).to eq 'Electronic'
      end
    end
  end

  describe "manage report" do
    before do
      reports = [
        {:uni => 'yp2604', :building => 'Mudd', :area => '1st floor classroom', :problemtype => 'Electronic', :emergencylevel => 'Urgent', :status => 'Uncompleted'}
      ]
      reports.each do |report|
        get :create, {:report => report}
      end
      manager = {:name => "Alan", :email => "sy3006@columbia.edu", :password=>"abc123", :password_confirmation=>"abc123"}
      Manager.create!(manager)
    end
    it "add empty comment" do
      get :addcmt, {:id => 1, :comment => {:cmt => ""}}, {:manager_id => 1}
      expect(flash[:notice]).to match(/Cannot add a blank comment/)
      expect(response).to redirect_to report_path(1)
    end
    it "add comment" do
      get :addcmt, {:id => 1, :comment => {:cmt => "asd"}}, {:manager_id => 1}
      expect(flash[:notice]).to match(/Comment successfully added/)
      expect((Comment.all).length ==1)
      expect(response).to redirect_to report_path(1)
    end
    it "mark as completed" do
      get :complete, {:id => 1}, {:manager_id => 1}
      expect(flash[:notice]).to match(/Marked as complete successful/)
      expect(response).to redirect_to report_path(1)
    end
  end

  describe "login requirement" do
    it "viewing report list requires login" do
      get :index
      expect(response).to redirect_to login_path
    end
    it "viewing report detail requires login" do
      get :show, {:id => 1}
      expect(response).to redirect_to login_path
    end
  end

end