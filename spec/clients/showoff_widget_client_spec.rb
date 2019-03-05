require 'rails_helper'

describe ShowoffWidgetClient do
  subject { ShowoffWidgetClient.new }
  
  it 'exists' do
    expect(subject).to be_a(ShowoffWidgetClient)
  end

  context 'Instance Methods' do
    describe '#find_widgets' do
      it 'returns visible widgets' do
        VCR.use_cassette('find_widgets') do
          results = subject.find_widgets

          expect(results).to be_a(Hash)
          expect(results).to have_key(:data)
          expect(results[:data]).to have_key(:widgets)
          expect(results[:data][:widgets]).to be_a(Array)
          expect(results[:data][:widgets][0]).to have_key(:id)
          expect(results[:data][:widgets][0]).to have_key(:name)
          expect(results[:data][:widgets][0]).to have_key(:description)
          expect(results[:data][:widgets][0]).to have_key(:kind)
          expect(results[:data][:widgets][0]).to have_key(:user)
          expect(results[:data][:widgets][0][:user]).to have_key(:id)
          expect(results[:data][:widgets][0][:user][:id]).to be_a(Integer)
          expect(results[:data][:widgets][0][:user]).to have_key(:name)
          expect(results[:data][:widgets][0][:user][:name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:images)
          expect(results[:data][:widgets][0][:user][:images][:small_url]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:first_name)
          expect(results[:data][:widgets][0][:user][:first_name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:last_name)
          expect(results[:data][:widgets][0][:user][:last_name]).to be_a(String)
        end
      end
    end

    describe '#find_user_widgets' do
      it 'returns all widgets created by a specific user' do
        VCR.use_cassette('find_widgets_by_user') do
          results = subject.find_widgets_by_user('1')

          expect(results).to be_a(Hash)
          expect(results).to have_key(:message)
          expect(results).to have_key(:data)
          expect(results[:data]).to have_key(:widgets)
          expect(results[:data][:widgets]).to be_a(Array)
          expect(results[:data][:widgets][0]).to have_key(:id)
          expect(results[:data][:widgets][0][:id]).to be_a(Integer)
          expect(results[:data][:widgets][0]).to have_key(:name)
          expect(results[:data][:widgets][0]).to have_key(:description)
          expect(results[:data][:widgets][0]).to have_key(:kind)
          expect(results[:data][:widgets][0]).to have_key(:user)
          expect(results[:data][:widgets][0][:user]).to have_key(:id)
          expect(results[:data][:widgets][0][:user][:id]).to be_a(Integer)
          expect(results[:data][:widgets][0][:user]).to have_key(:name)
          expect(results[:data][:widgets][0][:user][:name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:images)
          expect(results[:data][:widgets][0][:user][:images][:small_url]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:first_name)
          expect(results[:data][:widgets][0][:user][:first_name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:last_name)
          expect(results[:data][:widgets][0][:user][:last_name]).to be_a(String)
        end
      end
    end

    describe '#search_widgets' do
      it 'returns all widgets matching a keyword search' do
        VCR.use_cassette('search_widgets') do
          results = subject.search_widgets('widget')

          expect(results).to be_a(Hash)
          expect(results).to have_key(:message)
          expect(results).to have_key(:data)
          expect(results[:data]).to have_key(:widgets)
          expect(results[:data][:widgets]).to be_a(Array)
          expect(results[:data][:widgets][0]).to have_key(:id)
          expect(results[:data][:widgets][0][:id]).to be_a(Integer)
          expect(results[:data][:widgets][0]).to have_key(:name)
          expect(results[:data][:widgets][0]).to have_key(:description)
          expect(results[:data][:widgets][0]).to have_key(:kind)
          expect(results[:data][:widgets][0]).to have_key(:user)
          expect(results[:data][:widgets][0][:user]).to have_key(:id)
          expect(results[:data][:widgets][0][:user][:id]).to be_a(Integer)
          expect(results[:data][:widgets][0][:user]).to have_key(:name)
          expect(results[:data][:widgets][0][:user][:name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:images)
          expect(results[:data][:widgets][0][:user][:images][:small_url]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:first_name)
          expect(results[:data][:widgets][0][:user][:first_name]).to be_a(String)
          expect(results[:data][:widgets][0][:user]).to have_key(:last_name)
          expect(results[:data][:widgets][0][:user][:last_name]).to be_a(String)
        end
      end
    end
  end
end