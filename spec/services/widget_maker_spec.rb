require 'rails_helper'

describe WidgetMaker do
  it 'can make widgets from attributes' do
    attributes = {
                  :id=>121,
                  :name=>"Super Sweet Widget",
                  :description=>"So so sweet",
                  :kind=>"visible",
                  :user=> {
                            :id=>234,
                            :name=>"Me Myself",
                            :images=> {
                                        :small_url=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/234/small/961-200.png?1551641472",
                                        :medium_url=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/234/medium/961-200.png?1551641472",
                                        :large_url=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/234/large/961-200.png?1551641472",
                                        :original_url=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/234/original/961-200.png?1551641472"
                                      },
                            :first_name=>"Me",
                            :last_name=>"Myself",
                            :date_of_birth=>nil,
                            :email=>"me@me.com",
                            :active=>true
                          },
                  :owner=>true
                  }
    widget = WidgetMaker.new(attributes)

    expect(widget.name).to eq('Super Sweet Widget')
    expect(widget.description).to eq('So so sweet')
    expect(widget.kind).to eq('visible')
    expect(widget.user_id).to eq(234)
    expect(widget.created_by).to eq('Me Myself')
  end
end
