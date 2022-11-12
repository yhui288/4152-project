require 'carrierwave/test/matchers'

describe FileUploader do
  include CarrierWave::Test::Matchers

  let(:report) { Report.create(:building => 'test',:area => 'test') }
  let(:uploader) { FileUploader.new(report, :avatar) }

  before do
    # FileUploader.enable_processing = false
    File.open("#{Rails.root}/public/images/rails.png") { |f| uploader.store!(f) }
  end

  after do
    FileUploader.enable_processing = false
    uploader.remove!
  end

  it "has the correct path" do
    expect(uploader.store_dir).to eq('uploads/report/avatar/1')
  end
end
