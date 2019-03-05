require 'rails_helper'

context 'User can log in and log out' do
  before(:each) do
    @user = User.create!(first_name: 'Old', last_name: 'Gregg', email: 'imoldgregg@cave.com', password: 'baileys', password_confirmation: 'baileys')
  end

  describe 'User provides complete and correct credentials' do
    it 'logs the user in' do
      visit '/widgets'

      click_on 'Sign In'

      fill_in :login_email,	with: @user.email
      fill_in :login_password,	with: @user.password  

      click_button 'Sign In'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Successfully signed in')
      expect(page).to have_content('Welcome, Old')
    end
  end

  describe 'User provides incomplete credentials' do
    it 'does not log the user in and redirects the user to the sign in screen' do
      visit '/widgets'

      click_on 'Sign In'

      fill_in :login_email,	with: @user.email
      fill_in :login_password,	with: ''  

      click_button 'Sign In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid email or password')
    end
  end

  describe 'User provides incorrect credentials' do
    it 'does not log the user in and redirects the user to the sign in screen' do
      visit '/widgets'

      click_on 'Sign In'

      fill_in :login_email,	with: @user.email
      fill_in :login_password,	with: 'so_creamy'  

      click_button 'Sign In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid email or password')
    end
  end

  describe 'User clicks sign out' do
    it 'signs the user out and redirects the user to the home screen' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      
      visit '/widgets'

      click_on 'Sign Out'

      expect(current_path).to eq(widgets_path)
      expect(page).to_not have_content('Welcome, Old')
    end
  end
end