require 'rails_helper'

RSpec.describe 'Category Index page', type: :feature do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Tamara Dimov', email: 'tamara@gmail.com', password: '123456')

      visit user_groups_path(@user)

      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'

      visit user_groups_path(@user)
    end

    it 'shows the add category link' do
      expect(page).to have_link('ADD CATEGORY')
    end

    it 'should have logout link' do
      expect(page).to have_content('Log out')
    end
  end
end
