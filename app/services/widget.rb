class Widget

  attr_reader :name, 
              :description,
              :user_id,
              :user_avatar,
              :created_by

  def initialize(data)
    @widget_id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @user_id = data[:user][:id]
    @user_avatar = data[:user][:images][:small_url]
    @created_by = data[:user][:name]
  end
end