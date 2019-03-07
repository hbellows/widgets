class MyEditWidgetFacade
  include ClientConnector

  attr_reader :user_token, :data, :widget_id

  def initialize(user, widget_data, widget_id)
    @user_token = user.token
    @data = widget_data
    @widget_id = widget_id
  end

  def payload_builder
    payload = Hash.new  
    unless data[:name] == ''
      payload[:name] = data[:name]
    end
    payload
    unless data[:description] == ''
      payload[:description] = data[:description]
    end
    payload
    unless data[:kind] == ''
      payload[:kind] = data[:kind]
    end
    payload
  end

  def payload
    {
      "widget": payload_builder
    }
  end

  def edit_widget
    showoff_user_client.put_widget(user_token, widget_id, payload)
  end
end