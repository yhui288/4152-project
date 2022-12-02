class Report < ActiveRecord::Base
    has_many :comments
    mount_uploader :file, FileUploader
    def self.problemlist
        return ['Carpentry', 'Electronic','Floor','Furniture','Laundry','Mechanical','Pest Control','Housekeeping','Heating/Air Conditioning', 'Plumbing', 'Other']
    end

    def self.check_and_create(report_params)
        if Report.where(building: report_params[:building], area: report_params[:area]).take.nil?
            report_params[:status] = "Uncompleted"
            report = Report.create!(report_params)
            if report_params[:emergencylevel] == 'Urgent'
                Manager.all.each do |manager|
                  NoticeMailer.urgent_notice(manager.email, report).deliver_later
                end
                return "successfully published and managers are notified"
            end
            return "successfully published"
        else
            return "Already been published"
        end
    end
end
