class Users::WidgetsController < ApplicationController
  before_action :require_user, :user, only: :index

  def index
    @my_widgets = MyWidgetsFacade.new(current_user)
  end

  private

  def user
    @user ||= User.find(current_user.id)
  end

end