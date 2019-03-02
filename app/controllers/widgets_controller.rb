class WidgetsController < ApplicationController

  def index
    @widgets = WidgetFinder.new
  end

  private
  
  
end