class WidgetsController < ApplicationController

  def index
    @widgets = WidgetsFacade.new
  end

  def show
    @user_widgets = UserWidgetsFacade.new(params[:id])
  end

end