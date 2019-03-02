class Widget

  attr_reader :name, 
              :description,
              :user_id,
              :created_by

  def initialize(data)
    @widget_id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @user_id = data[:user][:id]
    @created_by = data[:user][:name]
  end
end