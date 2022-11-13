module ReportsHelper
  # Checks if a number is odd:
  # def oddness(count)
  #   count.odd? ?  "odd" :  "even"
  # end
  def self.valid_uni?(uni)
    uni.match?(/^[a-z][a-z][0-9][0-9][0-9][0-9]$/x) or report_params[:uni].match?(/^[a-z][a-z][a-z][0-9][0-9][0-9][0-9]$/x)
  end
end
