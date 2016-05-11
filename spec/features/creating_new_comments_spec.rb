require 'rails_helper'

feature 'commenting on events' do
	background do 
		user = create :user
		event = create(:event, name: 'test event', user_id: user.id)

		sign_in_with user
		visit '/'
	end

	scenario 'create a comment' do
		fill_in 'Add a comment...', with: 'this is my test comment\n'
		# click_button 'Submit'
		expect(page).to have_content('this is my test comment')
	end
end