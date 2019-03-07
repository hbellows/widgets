class MyDeleteWidgetFacade
  include ClientConnector

  attr_reader :user_token, :widget_id

  def initialize(user, widget_id)
    @user_token = user.token
    @widget_id = widget_id
  end

  def delete_widget
    showoff_user_client.delete_widget(user_token, widget_id)
  end
end