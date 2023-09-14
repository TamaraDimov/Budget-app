class PaymentsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @payments = @group.payments.order(created_at: :desc)
  end

  def new
    @payment = current_user.payments.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end

  def create
    @payment = Payment.new(name: payment_params[:name], amount: payment_params[:amount], author_id: current_user.id)
    @group = Group.find(params[:group_id])

    if @payment.save
      @payment_item = PaymentItem.new(payment_id: @payment.id, group_id: params[:payment_item][:group_id])

      redirect_to user_group_path(current_user, @group), notice: 'Payment successfully created.' if @payment_item.save

    else
      render :new, status: :unprocessable_entity
    end
  end

  def payment_params
    params.require(:payment_item).permit!
  end
end
