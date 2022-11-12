class Report < ActiveRecord::Base
  mount_uploader :file, FileUploader
    def self.check_and_create(report_params)
        if Report.where(building: report_params[:building], area: report_params[:area]).take.nil?
            report_params[:status] = "Uncompleted"
            Report.create!(report_params.except!(:uni))
            return "successfully published"
        else
            return "Already been published"
        end
    end
end
