class PagesController < ApplicationController
    def home; end
    
    def qr_code_generate; end
  
    def qr_code_download
        # https://mighty-brushlands-39335.herokuapp.com
        url = 'http://localhost:3000%s' % [new_report_path(:report => {:building => params[:report][:building], :area => params[:report][:area]})]
        puts url
        send_data RQRCode::QRCode.new(url).as_png(size: 300), type: 'image/png', disposition: 'attachment'
    end
end