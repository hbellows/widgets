class MyEditWidgetFacade

  def initialize(user, widget_data)
    @user_token = user.token
    @widget_data = widget_data
  end
end