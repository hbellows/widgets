class WidgetsController < ApplicationController

  def index
    @widgets = WidgetsFacade.new
  end

end