class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @groups = current_user.groups.all.includes(:payments)
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @payments = @group.payments.order('created_at DESC')
  end

  def create
    @user = current_user
    @group = Group.new(
      name: new_group_params['name'],
      icon: new_group_params['icon'],
      user_id: current_user.id
    )
    if @group.save
      flash[:success] = 'You successfully created new Category'
      redirect_to user_groups_path(user_id: current_user.id)
    else
      flash[:alert] = 'Category was not created'
    end
  end

  def new_group_params
    params.require(:new_group).permit(:name, :icon)
  end
end
