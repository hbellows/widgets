class ShowoffClient
  include ApiConnector

  def find_widgets
    get_json('/api/v1/widgets/visible')
  end

  def find_user_widgets(user_id)
    get_json("/api/v1/users/#{user_id}/widgets")
  end

  def search_widgets(keyword)
    get_json("/api/v1/widgets/visible?term=#{keyword}")
  end
end