require 'rails_helper'

feature 'creating posts' do
	background do
		user = create :user
		
		sign_in_with user
	end
	scenario 'can create a new event' do
		visit '/'
		click_link 'Create Event'
		attach_file('No file chosen', "spec/files/images/test.jpg")
		fill_in 'Add your event name', with: 'using test #testimage'
		click_button 'Create Event'
		expect(page).to have_content('#testimage')
		expect(page).to have_content('Event created!')
		expect(page).to have_css("img[src*='test.jpg']")
		expect(page).to have_content('testrailsdev')
	end

	it 'needs image' do
		visit '/'
		click_link 'Create Event'
		fill_in 'Add your event name', with: 'using test without image'
		click_button 'Create Event'
		expect(page).to have_content('Event could not be created.')
	end
end