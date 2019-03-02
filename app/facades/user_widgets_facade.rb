class UserWidgetsFacade

  attr_reader :user_id  

  def initialize(user_id)
    @user_id = user_id
  end

  def visible
    user_widgets_data.map do |widget|
      Widget.new(data)
    end
  end

  private

  def widget_client
    @widget_client = WidgetClient.new
  end

  def user_widgets_data
    widget_client.find_user_widgets(user_id)
  end

end