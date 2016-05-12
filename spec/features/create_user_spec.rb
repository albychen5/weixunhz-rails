require 'rails_helper'

feature 'Creating new user' do
	background do
		visit '/'
		click_link 'Register'
	end

	scenario 'can create new user on index page' do 
		fill_in 'Username', with: "testrailsdev"
		fill_in 'Email', with: "testrailsdev@weixunhz.com"
		fill_in 'Password', with: "password", match: :first
		fill_in 'Confirm Password', with: "password"

		click_button 'Sign up'
		expect(page).to have_content("Welcome! You have signed up")
	end

	scenario 'requires username to successfully create an account' do
		fill_in 'Email', with: "testrailsdev@weixunhz.com"
		fill_in 'Password', with: "password", match: :first
		fill_in 'Confirm Password', with: "password"

		click_button 'Sign up'
		expect(page).to have_content("can't be blank")
	end

	scenario 'requires username to be more than 3 characters' do
		fill_in 'Username', with: "a"
		fill_in 'Email', with: "testrailsdev@weixunhz.com"
		fill_in 'Password', with: "password", match: :first
		fill_in 'Confirm Password', with: "password"

		click_button 'Sign up'
		expect(page).to have_content("minimum is 3 characters")
	end

	scenario 'requires username to be less than 16 characters' do
		fill_in 'Username', with: "a" * 17
		fill_in 'Email', with: "testrailsdev@weixunhz.com"
		fill_in 'Password', with: "password", match: :first
		fill_in 'Confirm Password', with: "password"

		click_button 'Sign up'
		expect(page).to have_content("maximum is 16 characters")
	end
end