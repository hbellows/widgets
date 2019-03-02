class WidgetsFacade

  def visible
    widget_data.map do |widget|
      Widget.new(widget)
    end
  end

  private

  def showoff_client
    @showoff_client ||= ShowoffClient.new
  end

  def widget_data
    showoff_client.find_widgets[:data][:widgets]
  end
end