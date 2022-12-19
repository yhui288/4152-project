class Report < ActiveRecord::Base
    has_many :comments
    mount_uploader :file, FileUploader
    def self.problemlist
        return [
            "Miscellaneous/Other",
            "Air Conditioning/Heating",
            "Bathroom/Restroom Items",
            "Ceiling",
            "Classroom Equipment",
            "Clean + Go Green",
            "Cleaning",
            "Computer & Projector",
            "Detectors/Alarms", 
            "Door",
            "Elevator",
            "Floor",
            "Furnishings - Classroom",
            "Furnishings - Other",
            "Hand Sanitizer",
            "Lab Fixtures/Services",
            "Lights",
            "Locks & Keys",
            "Moving/Carting",
            "Paint",
            "Pest Control",
            "Plumbing Services",
            "Power",
            "Recycling",
            "Stairs - Eexterior",
            "Stairs - Interior",
            "Switches/Sockets",
            "Walkway - Exterior",
            "Wall",
            "Windows/Glass",
        ]
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
