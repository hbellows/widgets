class WidgetMaker

  attr_reader :name, 
              :description,
              :kind,
              :user_id,
              :created_by

  def initialize(data)
    @widget_id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @kind = data[:kind]
    @user_id = data[:user][:id]
    @created_by = data[:user][:name]
  end
end