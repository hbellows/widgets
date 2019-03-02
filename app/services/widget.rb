class Widget

  attr_reader :name, 
              :description,
              :created_by

  def initialize(data)
    @widget_id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @created_by = data[:user][:name]
  end
end