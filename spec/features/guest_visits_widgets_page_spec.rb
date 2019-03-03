require 'rails_helper'

describe 'Widgets Page' do
  context 'A guest visits the widgets page and' do
    it 'displays all visible widgets and the name of the widget\'s creator' do
      VCR.use_cassette('Widgets Index Page') do
        visit '/widgets'

        expect(page).to have_content('Widgets')
        expect(page).to have_css('.widget', count: 20)
        within(first('.widget')) do
          expect(page).to have_content('A Visible Widget')
          expect(page).to have_content('Widget 1')
          expect(page).to have_link('tyler Thunderbird')
        end
      end
    end
  end

  context 'A guest clicks on the creator name and' do
   it 'displays all visible widgets created by a specific user' do
      VCR.use_cassette('Widgets by User Page') do
        visit '/widgets'

        within(first('.widget')) do
          find_link('tyler Thunderbird').click
        end

        expect(current_path).to eq('/widgets/1')


        expect(page).to have_content('tyler Thunderbird')
        expect(page).to have_css('.user-avatar')
        expect(page).to have_css('.widget', count: 1)
        within(first('.widget')) do
          expect(page).to have_content('A Visible Widget')
          expect(page).to have_content('Widget 1')
        end
      end
    end
  end
end