require 'rails_helper'

feature 'display events on index' do
	scenario 'index displays job info' do
		job_one = create(:event, name: "event one")
		job_two = create(:event, name: "event two")

		visit '/'
		expect(page).to have_content("event one")
		expect(page).to have_content("event two")
		expect(page).to have_css("img[src*='test']")
	end
end