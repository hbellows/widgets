require 'rails_helper' 

context 'Guest Registration' do
  xdescribe 'Guest provides all required information' do
    it 'registers the guest' do
      visit '/widgets'
      click_on 'Sign Up'

      expect(current_path).to eq(new_registration_path)

      fill_in :register_first_name,	with: 'Mike' 
      fill_in :register_last_name,	with: 'Heft'
      fill_in :register_email,	with: 'mike@heft.com'
      fill_in :register_password,	with: 'hamburger1'
      fill_in :register_password_confirmation,	with: 'hamburger1' 
      click_on 'Create Account'

      expect(current_path).to eq(dashboard_path)

      user = User.first 
 
      expect(user.id).to eq(1)
      expect(user.first_name).to eq('Mike')
      expect(user.last_name).to eq('Heft')
      expect(user.email).to eq('mike@heft.com')
      expect(user.password_digest.length).to eq(60)
      expect(user.role).to eq('user')
    end
  end

  describe 'Guest provides incomplete information' do
    it 'displays an error message and does not register the guest' do
      visit '/widgets'
      click_on 'Sign Up'

      expect(current_path).to eq(new_registration_path)

      fill_in :register_first_name,	with: 'Mike' 
      fill_in :register_last_name,	with: ''
      fill_in :register_email,	with: 'mike@heft.com'
      fill_in :register_password,	with: 'hamburger1'
      fill_in :register_password_confirmation,	with: 'hamburger1' 
      click_on 'Create Account'

      expect(current_path).to eq(register_path)
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content('Create New Widgets Account')
    end
  end
end