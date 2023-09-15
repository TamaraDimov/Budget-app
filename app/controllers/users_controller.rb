class UsersController < ApplicationController
  def index
    @user = current_user
    return unless user_signed_in?

    redirect_to user_groups_path(user_id: @user.id)
  end

  def new; end
end
