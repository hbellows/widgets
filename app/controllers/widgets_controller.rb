class WidgetsController < ApplicationController

  def index
    @widgets = WidgetsFacade.new
  end

  def show
    binding.pry
    @user_widgets = UserWidgetsFacade.new(params[:id])
  end

end