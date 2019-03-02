class WidgetsFacade

  def visible
    widget_data.map do |widget|
      Widget.new(widget)
    end
  end

  private

  def widget_client
    @widget_client ||= WidgetClient.new
  end

  def widget_data
    widget_client.find_widgets[:data][:widgets]
  end
end