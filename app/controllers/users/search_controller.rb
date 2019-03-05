class Users::SearchController < ApplicationController

  def index
    @search_my_widgets = MyWidgetSearchFacade.new(params[:q])
  end
end