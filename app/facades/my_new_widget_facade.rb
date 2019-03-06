class MyNewWidgetFacade
  include ClientConnector

  attr_reader :user_token, :widget_data

  def initialize(user, widget_data)
    @user_token = user.token
    @widget_data = widget_data
  end

  def payload
    {
      "widget": {
                "name": widget_data[:name],
                "description": widget_data[:description],
                "kind": widget_data[:kind]
              }
    }
  end
  
  def create_new_widget
    showoff_user_client.post_new_widget(user_token, payload)
  end

end