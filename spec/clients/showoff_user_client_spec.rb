require 'rails_helper'

describe ShowoffUserClient do

  user_token = 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0'
  subject { ShowoffUserClient.new(user_token) }
  
  it 'exists' do
    expect(subject).to be_a(ShowoffUserClient)
  end

  context 'Instance Methods' do
    describe '#find_my_widgets' do
      it 'returns user\'s widgets' do
        VCR.use_cassette('find_my_widgets') do

          results = subject.find_my_widgets(user_token)

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

    describe '#search_my_widgets' do
      it 'returns user\'s search results' do
        VCR.use_cassette('search_my_widgets') do
          keyword = 'widget'
          results = subject.search_my_widgets(user_token, keyword)

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
  end
end