require 'rails_helper'

describe 'Widget Search' do
  context 'A guest enters keyword in the search box and' do
    it 'displays visible widgets matching the keyword' do
      VCR.use_cassette('Widgets Search Page') do
        visit '/widgets'

        fill_in :q, with: :widget
        click_on 'Search'

        expect(current_path).to eq('/search')

        expect(page).to have_css('#widget')
        within(first('#widget')) do
          expect(page).to have_content('A Visible Widget')
          expect(page).to have_content('Widget 1')
          expect(page).to have_link('tyler Thunderbird')
        end
      end
    end

    it 'displays a message if no matching widgets can be found' do
      VCR.use_cassette('Widgets Nil Search') do
        visit '/widgets'

        fill_in :q, with: :dog
        click_on 'Search'

        expect(current_path).to eq('/search')

        expect(page).to have_content("No widgets matching 'dog'")
      end
    end
  end
end