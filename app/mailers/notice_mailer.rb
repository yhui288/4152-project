class NoticeMailer < ApplicationMailer
  #default from: "1023990429@qq.com"

  def send_notice(uni, report)
    @report = report
    @uni_email = uni + "@columbia.edu"
    mail(to: @uni_email, subject: 'You repair request has been completed!')
  end

  def urgent_notice(manager_email, report)
    @report = report
    mail(to: manager_email, subject: "Urgent Report in [#{@report.building}]")
  end
end
