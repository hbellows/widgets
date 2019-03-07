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

  def put_widget(user_token, widget_id, payload)
    put_payload(widget_id, payload)
  end

  def delete_widget(user_token, widget_id)
    delete(widget_id)
  end
end