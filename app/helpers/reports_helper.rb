module ReportsHelper
  def self.valid_uni?(uni)
    uni.match?(/^[a-z][a-z][0-9][0-9][0-9][0-9]$/x) or uni.match?(/^[a-z][a-z][a-z][0-9][0-9][0-9][0-9]$/x)
  end
end
