class WidgetsController < ApplicationController

  def index
    @widgets = WidgetsFacade.new
  end

  def show
    @user_widgets = WidgetsByUserFacade.new(params[:id])
  end

end