class SearchController < ApplicationController

  def index
    @find_widgets = WidgetSearchFacade.new(params[:q])
  end
end