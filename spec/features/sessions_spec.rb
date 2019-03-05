require 'rails_helper'

context 'User can log in and log out' do
  before(:each) do
    @user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
                         password: 'hamburger1', password_confirmation: 'hamburger1',
                         token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
                         refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
                        )
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
      expect(page).to have_content('Welcome, Me')
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
      expect(page).to_not have_content('Welcome, Me')
    end
  end
end