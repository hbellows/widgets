require 'rails_helper' 

context 'Guest Registration' do
  describe 'Guest provides all required information' do
    it 'registers the guest' do
      visit '/widgets'
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)
    end
  end
end