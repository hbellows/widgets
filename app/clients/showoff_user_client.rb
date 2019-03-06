class ShowoffUserClient
  include UserConnector

  def initialize(user_token)
    @user_token = user_token
  end

  def find_my_widgets(user_token)
    get_json("/api/v1/users/me/widgets")
  end

  def search_my_widgets(user_token, keyword)
    get_json("/api/v1/users/me/widgets?term=#{keyword}")
  end

  def post_new_widget(user_token, payload)
    post_payload(payload)
  end

  def put_new_widget(user_token, payload)
    put_payload(payload)
  end
end