class MyWidgetsFacade
  include ClientConnector

  attr_reader :user_id, :user_token

  def initialize(user)
    @user_id = user.id
    @user_token = user.token
  end

  def visible
    find_visible_widgets.map do |widget|
      Widget.new(widget)
    end
  end
  
  def hidden
    find_hidden_widgets.map do |widget|
      Widget.new(widget)
    end
  end

  def find_visible_widgets
    my_widget_data.keep_if do |widget_data|
      widget_data[:kind] == 'visible'
    end
  end

  def find_hidden_widgets
    my_widget_data.keep_if do |widget_data|
      widget_data[:kind] == 'hidden'
    end
  end

  private

  def my_widget_data
    showoff_user_client.find_my_widgets(user_token)[:data][:widgets]
  end

end