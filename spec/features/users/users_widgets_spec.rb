require 'rails_helper'

context 'Signed in user can' do

  describe 'see all of their own widgets' do
    it 'displays hidden and visible widgets created by the current user' do
      VCR.use_cassette('User Widgets Index Page') do

        user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
          password: 'hamburger1', password_confirmation: 'hamburger1',
          token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
          refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
          )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        expect(page).to have_content('Welcome, Me')
        expect(page).to have_css('#visible-widget', count: 1)
        expect(page).to have_css('#hidden-widget', count: 1)

        within(first('#visible-widget')) do
          expect(page).to have_content('Super Sweet Widget')
          expect(page).to have_content('So so sweet')
        end

        within(first('#hidden-widget')) do
          expect(page).to have_content('Not So Super Sweet Widget')
          expect(page).to have_content('Not very sweet')
        end
      end
    end
  end

  describe 'search their own widgets' do
    it 'displays hidden and visible widgets matching the inputted keyword' do
      VCR.use_cassette('User Widgets Search Page') do

        user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
          password: 'hamburger1', password_confirmation: 'hamburger1',
          token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
          refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
          )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        fill_in :q, with: :not

        expect(page).to have_content('Welcome, Me')
        expect(page).to have_css('#visible-widget', count: 1)
        expect(page).to have_css('#hidden-widget', count: 1)

        within(first('#visible-widget')) do
          expect(page).to have_content('Super Sweet Widget')
          expect(page).to have_content('So so sweet')
        end

        within(first('#hidden-widget')) do
          expect(page).to have_content('Not So Super Sweet Widget')
          expect(page).to have_content('Not very sweet')
        end
      end
    end
  end

end