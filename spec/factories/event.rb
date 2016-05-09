FactoryGirl.define do
	factory :event do
		name "nofilter"
		image	Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/test.jpg', 'image/jpg')
	end
end