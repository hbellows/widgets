module ClientConnector
  private

  def showoff_widget_client
    @showoff_widget_client ||= ShowoffWidgetClient.new
  end

  def showoff_user_client
    @showoff_user_client ||= ShowoffUserClient.new(user_token)
  end
end