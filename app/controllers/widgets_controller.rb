class WidgetsController < ApplicationController

  def index
    @widgets = WidgetsFacade.new
  end

  def show
    @widgets_by_user = WidgetsByUserFacade.new(params[:id])
  end

end