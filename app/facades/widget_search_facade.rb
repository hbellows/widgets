class WidgetSearchFacade
  include ClientConnector

  attr_reader :keyword

  def initialize(keyword)
    @keyword = keyword
  end

  def visible
    widget_search_data.map do |widget|
      WidgetMaker.new(widget)
    end
  end

  def count
    if widget_search_data.empty?
      "No widgets matching '#{keyword}'"
    else
      "#{widget_search_data.count} widgets found"
    end
  end

  private

  def widget_search_data
    showoff_widget_client.search_widgets(keyword)[:data][:widgets]
  end
end