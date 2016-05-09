require 'rails_helper.rb'

feature 'creating posts' do
	scenario 'can create a job' do
		visit '/'
		click_link 'Create Event'
		attach_file('Image', "spec/files/images/test.jpg")
		fill_in 'Name', with: 'using test #testimage'
		click_button 'Create Event'
		expect(page).to have_content('#testimage')
		expect(page).to have_content('Event created!')
		expect(page).to have_css("img[src*='test.jpg']")
	end

	it 'needs image' do
		visit '/'
		click_link 'Create Event'
		fill_in 'Name', with: 'using test without image'
		click_button 'Create Event'
		expect(page).to have_content('Event could not be created.')
	end
end