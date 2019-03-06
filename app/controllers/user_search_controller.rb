class UserSearchController < ApplicationController
  before_action :require_user, :user, only: %i[index]
  
  def index
    @search_my_widgets = MyWidgetSearchFacade.new(current_user, params[:user_widget])
  end

  private

  def user
    @user ||= User.find(current_user.id)
  end
end