class NoticeMailer < ApplicationMailer
  default from: "1023990429@qq.com"

  def send_notice(uni, report)
    @report = report
    @uni_email = uni + "@columbia.edu"
    mail(to: @uni_email, subject: 'Notification of report')
  end
end
