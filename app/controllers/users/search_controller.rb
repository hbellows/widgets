class Users::SearchController < ApplicationController

  def index
    @search_my_widgets = MyWidgetSearchFacade.new(current_user, params[:user_widget])
  end
end