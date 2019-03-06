class MyWidgetSearchFacade
  include ClientConnector

  attr_reader :user_token, :keyword

  def initialize(user, keyword)
    @user_token = user.token
    @keyword = keyword
  end

  def visible
    user_widget_search_data.map do |widget|
      Widget.new(widget)
    end
  end

  def count
    if user_widget_search_data.empty?
      "No widgets matching '#{keyword}'"
    else
      "#{user_widget_search_data.count} widgets found"
    end
  end

  private

  def user_widget_search_data
    showoff_user_client.search_my_widgets(user_token, keyword)[:data][:widgets]
  end
end