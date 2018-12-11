require 'rails_helper'

RSpec.feature "Visitor login", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create(first_name: 'Test', last_name: 'User', email: 'test@test.com', password: 'password', password_confirmation: 'password')
  end

  scenario 'they can login' do
    visit '/login'


    within 'form' do
      fill_in 'email', with: "#{@user.email}"
      fill_in 'password', with: "#{@user.password}"

      click_button 'Submit'
    end

    expect(page).to have_content "Signed in as #{@user.email}"

    save_screenshot 'login.png'
  end
end
