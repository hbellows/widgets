class UsersController < ApplicationController
  before_action :require_user, :user, only: :show

  def show; end

  private

  def user
    @user ||= User.find(current_user.id)
  end
end