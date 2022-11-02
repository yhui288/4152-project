require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    describe "generate QR code" do
        it "should download a QR code as image" do
            get :qrcode_download, {:report => {:building => 'Davis Auditorium', :area => '1st floor'}}
            expect(response).to have_http_status(:success)
            # Image downloading checked in cucumber
        end
    end
end