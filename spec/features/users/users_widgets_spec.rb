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
        
        within('#user-nav') do
          fill_in :user_widget, with: :not
          click_on 'Search'
        end

        expect(page).to have_content('1 widgets found')

        within(first('#widget')) do
          expect(page).to have_content('Not So Super Sweet Widget')
          expect(page).to have_content('Not very sweet')
          expect(page).to have_content('hidden')
        end
      end
    end
  end

  describe 'Create a widget' do
    it 'displays the newly created in the user\'s list of widgets' do
      VCR.use_cassette('User Create Widget Page') do

        user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
          password: 'hamburger1', password_confirmation: 'hamburger1',
          token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
          refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
          )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'
        
        click_on 'New Widget'

        expect(current_path).to eq(new_widget_path)


        fill_in :user_widgets_name, with: 'New Widgety Widget'
        fill_in :user_widgets_description, with: 'So shiny'
        choose('Visible')

        click_on 'Create Widget'

        expect(current_path).to eq(dashboard_path)

        within('.my-visible-widgets') do
          expect(page).to have_content('New Widgety Widget')
          expect(page).to have_content('So shiny')
        end
      end
    end
  end

  describe 'Edit a widget' do
    it 'displays the newly created in the user\'s list of widgets' do
      VCR.use_cassette('User Edit Widget Page') do

        user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
          password: 'hamburger1', password_confirmation: 'hamburger1',
          token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
          refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
          )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'
        
        within(first('#visible-widget')) do
          click_on 'Edit'
        end

        expect(current_path).to eq(edit_widget_path(121))

        fill_in :user_widgets_description, with: "I'm hiding"
        choose('Hidden')

        click_on 'Edit Widget'

        expect(current_path).to eq(dashboard_path)

        within('.my-visible-widgets') do
          expect(page).to_not have_content('Super Sweet Widget')
          expect(page).to_not have_content('So so sweet')
        end

        within('.my-hidden-widgets') do
          expect(page).to have_content('Super Sweet Widget')
          expect(page).to have_content("I'm hiding")
        end
      end
    end
  end
end