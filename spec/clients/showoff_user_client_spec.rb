require 'rails_helper'

describe ShowoffUserClient do
  user = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
    password: 'hamburger1', password_confirmation: 'hamburger1',
    token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
    refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
    ) 

  subject { ShowoffUserClient.new(user.token) }
  
  it 'exists' do
    expect(subject).to be_a(ShowoffUserClient)
  end

  context 'Instance Methods' do
    describe '#find__my_widgets' do
      it 'returns user\'s widgets' do
        VCR.use_cassette('find_my_widgets') do

          results = subject.find_my_widgets(user.token)

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