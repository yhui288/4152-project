class PagesController < ApplicationController
    def home; end
    
    def qrcode_generate; end
  
    def qrcode_download
        # https://mighty-brushlands-39335.herokuapp.com
        # http://localhost:3000
        building = params[:report][:building]
        area = params[:report][:area]
        url = 'https://mighty-brushlands-39335.herokuapp.com%s' % [new_report_path(:report => {:building => building, :area => area})]
        fn = '%s_%s_qrcode.png' % [building.downcase, area.downcase]
        send_data RQRCode::QRCode.new(url).as_png(size: 300), type: 'image/png', filename: fn, disposition: 'attachment'
    end
end