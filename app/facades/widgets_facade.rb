class WidgetsFacade

  def visible
    widget_data
  end

  private

  def widget_client
    @widget_client ||= WidgetClient.new
  end
end