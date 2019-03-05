class SessionsController < ApplicationController
  before_action :user, :authenticate_user, :validate_credentials, only: :create
  before_action :require_user, :destroy_session, only: :destroy

  def new; end

  def create
    session[:user_id] = user.id
    flash.alert = 'Successfully signed in'
    redirect_to dashboard_path
  end

  def destroy
    flash[:success] = 'Successfully signed out'
    redirect_to widgets_path
  end
  
  private
  
  def user
    @user ||= User.find_by(email: params[:login][:email])
  end

  def authenticate_user
    user && user.authenticate(params[:login][:password])
  end

  def validate_credentials
    unless authenticate_user
      flash.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy_session
    session.delete(:user_id)
  end
end