require 'rails_helper' 

context 'Guest Registration' do
  describe 'Guest provides all required information' do
    it 'registers the guest' do
      visit '/widgets'
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)
      # save_and_open_page

      fill_in :user_first_name,	with: 'Mike' 
      fill_in :user_last_name,	with: 'Heft'
      fill_in :user_email,	with: 'mike@heft.com'
      fill_in :user_password,	with: 'hamburger1'
      fill_in :user_password_confirmation,	with: 'hamburger1' 
      click_on 'Create Account'

      expect(current_path).to eq(dashboard_path)
    end
  end
end