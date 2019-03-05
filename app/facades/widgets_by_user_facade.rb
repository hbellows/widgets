class WidgetsByUserFacade
  include ClientConnector

  attr_reader :user_id  

  def initialize(user_id)
    @user_id = user_id
  end

  def created_by
    widgets_by_user_data[0][:user][:name]
  end

  def avatar
    widgets_by_user_data[0][:user][:images][:small_url]
  end

  def visible
    widgets_by_user_data.map do |widget|
      Widget.new(widget)
    end
  end

  private

  def widgets_by_user_data
    showoff_widget_client.find_widgets_by_user(user_id)[:data][:widgets]
  end
end