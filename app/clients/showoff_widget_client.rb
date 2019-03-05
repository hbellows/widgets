class ShowoffWidgetClient
  include WidgetConnector

  def find_widgets
    get_json('/api/v1/widgets/visible')
  end

  def find_widgets_by_user(user_id)
    get_json("/api/v1/users/#{user_id}/widgets")
  end

  def search_widgets(keyword)
    get_json("/api/v1/widgets/visible?term=#{keyword}")
  end
end