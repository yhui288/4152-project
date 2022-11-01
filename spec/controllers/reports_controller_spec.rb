require 'rails_helper'


RSpec.describe ReportsController, type: :controller do
  before(:all) do
    if Report.where(:building => 'Butler').empty?
      Report.create(:building => 'Butler',:area => 'Restroom 4th FL',
         :problemtype=> 'Plumbing', :emergencylevel => 'Emergent',
         :status => 'Uncomplete')
    end
  end

  describe "creates" do
    it "reports with valid parameters" do
      get :create, {:report => {:uni => 'jg4403',:building => 'Pumpin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Emergent',
                                :status => 'Uncomplete'}}
      expect(flash[:notice]).to match(/successfully published/)
      expect(response).to redirect_to reports_path
      Report.find_by(:building => 'Pumpin').destroy
    end

    it "reports with invalid uni" do
      get :create, {:report => {:uni => '!!!',:building => 'Pumpin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Emergent',
                                :status => 'Uncomplete'}}
      expect(flash[:notice]).to match(/invalid UNI/)
      expect(response).to redirect_to reports_path
    end

    it "reports with dupliacted examples" do
      get :create, {:report => {:uni => 'jg4403',:building => 'Pumpin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Emergent',
                                :status => 'Uncomplete'}}
      expect(flash[:notice]).to match(/successfully published/)
      expect(response).to redirect_to reports_path

      get :create, {:report => {:uni => 'jg4403',:building => 'Pumpin',:area => 'Lab1034',
                                :problemtype=> 'Electronic', :emergencylevel => 'Emergent',
                                :status => 'Uncomplete'}}
      expect(flash[:notice]).to match(/Already been published/)
      expect(response).to redirect_to reports_path
    end
  end

  describe "updates" do
    it "update report valid attributes" do
      report = Report.create(:building => 'test',:area => 'test',
                                :problemtype=> 'Electronic', :emergencylevel => 'Emergent',
                                :status => 'Uncomplete')
      get :update, {:id => report.id, :report => {:building => 'new test'}}
      expect(Report.where(:building => 'new test')).not_to be_empty
      expect(Report.where(:building => 'test')).to be_empty
      expect(response).to redirect_to report_path(report)
      report.destroy
    end
  end

end