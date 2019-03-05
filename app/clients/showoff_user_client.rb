class ShowoffUserClient
  include UserConnector

  def initialize(user_token)
    @user_token = user_token
  end

  def find_my_widgets(user_token)
    get_json("/api/v1/widgets")
  end
end