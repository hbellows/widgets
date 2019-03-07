class UserWidgetsController < ApplicationController
  before_action :require_user, :user, except: %i[show]

  def index
    @my_widgets = MyWidgetsFacade.new(current_user)
  end

  def new; end
  
  def create
    @make_widget = MyNewWidgetFacade.new(current_user, widget_params).create_new_widget
    redirect_to dashboard_path
  end

  def edit; end

  def update
    @edit_widget = MyEditWidgetFacade.new(current_user, widget_params, params[:id]).edit_widget
    redirect_to dashboard_path
  end

  private

  def widget_params
    params.require(:user_widgets).permit(:name, :description, :kind)
  end

  def user
    @user ||= User.find(current_user.id)
  end
end
