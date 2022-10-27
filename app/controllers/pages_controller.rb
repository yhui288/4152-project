class PagesController < ApplicationController
    def home; end
    
    def qr_code_generate; end
  
    def qr_code_download
        # TODO: change to heroku url
        url = 'http://localhost:3000/'
        send_data RQRCode::QRCode.new(url).as_png(size: 300), type: 'image/png', disposition: 'attachment'
    end
end