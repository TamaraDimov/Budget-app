require 'rails_helper'

RSpec.describe 'index', type: :system do
  describe 'index page' do
    before :each do
      visit root_path
    end

    it 'shows the login button' do
      expect(page).to have_link('Log In')
    end

    it 'shows the sign up button' do
      expect(page).to have_link('Sign Up')
    end

    it 'shows the name of the app' do
      expect(page).to have_content('Your personal Budget tracker')
    end

    it 'should go to the login page' do
      click_on 'Log In'
      expect(page).to have_content('LOGIN')
    end

    it 'should go to the register page' do
      click_on 'Sign Up'
      expect(page).to have_content('SIGN UP')
    end
    it 'should not have this content' do
      expect(page).to_not have_content('Snap scan')
    end
    it 'does not exist on the page' do
      expect(page).to_not have_content('Welcome')
    end
  end
end