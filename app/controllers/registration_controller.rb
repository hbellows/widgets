class RegistrationController < ApplicationController
  before_action :require_user, :user, only: :show
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.alert = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:register).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation)
  end
end