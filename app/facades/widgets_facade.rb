class WidgetsFacade
  include ClientConnector

  def visible
    widget_data.map do |widget|
      Widget.new(widget)
    end
  end

  private

  def widget_data
    showoff_widget_client.find_widgets[:data][:widgets]
  end
end