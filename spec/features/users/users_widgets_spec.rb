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

        user = User.create!(first_name: 'Old Gregg', last_name: 'Baileys', email: 'me@cave.com',
          password: 'hamburger1', password_confirmation: 'hamburger1',
          token: '4536c1d91b36cd0471fe1c5ec736f803306289264b286803115d0307a89463b5', 
          refresh: '361a9330c1917283bd4c149dbeb5e61d776f5d7646ae126e6186d62cd9a2df59' 
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

        within(first('#visible-widget')) do
          expect(page).to have_content('New Widgety Widget')
          expect(page).to have_content('So shiny')
        end
      end
    end
  end

  describe 'Edit a widget' do
    it 'displays the edited in the user\'s list of widgets' do
      VCR.use_cassette('User Edit Widget Page') do

        user = User.create!(first_name: 'Justa', last_name: 'User', email: 'user@me.com',
          password: 'imjustauser', password_confirmation: 'imjustauser',
          token: '4ff34069ded782a13d7e9685d4c25f86b0393b2c68f2a8f0204993557f78a204', 
          refresh: '7ff7f9aa4a56830b1044c5a173a9ae35a855daf24a98c9392e4e8a842bcc0d8f' 
          )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        visit '/dashboard'

        within(first('#visible-widget')) do

          expect(page).to_not have_content("I'm hidden!")
          click_on 'Edit'
        end


        fill_in :user_widgets_description, with: "I'm hiding!"
        choose('Hidden')

        click_on 'Edit Widget'

        expect(current_path).to eq(dashboard_path)

        within(first('#hidden-widget')) do
          expect(page).to have_content("I'm hiding!")
        end

        #---------------RESET WIDGET FOR CI-------------------
        within(first('#hidden-widget')) do
          click_on 'Edit'
        end

        fill_in :user_widgets_description, with: "I'm visible"
        choose('Visible')
      end
    end
  end

  describe 'Delete a widget' do
    it 'deleted widget is not displayed in the user\'s list of widgets' do
      # VCR.use_cassette('User Delete Widget Page') do

        user = User.create!(first_name: 'Boss', last_name: 'Baby', email: 'boss@me.com',
          password: 'imabossbaby', password_confirmation: 'imabossbaby',
          token: '4355f094978ce1c7dbc074a8a07056b402b60f13adbb39f2893becd9dc256e9d',
          refresh: '301c9c023c798d38a0c97067b8164b9cd0eb2e91827e9e28ad8e4208c35f4453'
        )
        
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        #----------CREATE WIDGET------------------------------
        visit '/dashboard'

        click_on 'New Widget'

        expect(current_path).to eq(new_widget_path)


        fill_in :user_widgets_name, with: 'Test Widget'
        fill_in :user_widgets_description, with: "I'm visible!"
        choose('Visible')

        click_on 'Create Widget'

        expect(current_path).to eq(dashboard_path)

        within(first('#visible-widget')) do
          expect(page).to have_content('Test Widget')
          expect(page).to have_content("I'm visible!")
        end

        #----------DELETE WIDGET------------------------------

        within(first('#visible-widget')) do
          click_on 'Delete'
        end

        expect(current_path).to eq(dashboard_path)

        expect(page).to_not have_content('Test Widget')
        expect(page).to_not have_contect("I'm visible!")

        #-----------RECREATE WIDGET FOR CI--------------------

        click_on 'New Widget'

        expect(current_path).to eq(new_widget_path)

        fill_in :user_widgets_name, with: 'Test Widget'
        fill_in :user_widgets_description, with: "I'm visible!"
        choose('Visible')

        click_on 'Create Widget'
      # end
    end
  end

end