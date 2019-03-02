class UserWidgetsFacade

  attr_reader :user_id  

  def initialize(user_id)
    @user_id = user_id
  end

  def created_by
    user_widgets_data[0][:user][:name]
  end

  def avatar
    user_widgets_data[:data][:widgets][0][:user][:images][:small_url]
  end

  def visible
    user_widgets_data.map do |widget|
      Widget.new(widget)
    end
  end

  private

  def widget_client
    @widget_client ||= WidgetClient.new
  end

  def user_widgets_data
    widget_client.find_user_widgets(user_id)[:data][:widgets]
  end

end