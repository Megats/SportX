class Users::OnboardPaymentsController < ApplicationController
  before_action :set_onboard_payment, only: %i[ show edit update destroy ]
  before_action :get_event

  def index
    @participant = @event.participants.new
    @categories = Category.where(event_id: params[:event_id])
  end

  def register
    @event = Event.find(params[:event_id])
    @categories = Category.where(event_id: params[:event_id])
  end

  def update
    if current_user.step1?
      step1
    elsif current_user.step2?
      step2
    elsif current_user.step3?
      step3
    elsif current_user.step4?
      step4
    end

    if current_user.finish?
      redirect_to authenticated_admin_root_path
    else
      Rails.logger.debug current_user.errors.inspect
      redirect_to user_event_onboard_payments_path
    end
  end

  def step1
    Rails.logger.debug "MERGEE #{params_account}"
    if @participant.create(participant_params)
      current_admin.update_columns(onboard: 2)
    end
    Rails.logger.debug "step1 #{@participant.errors.inspect}"
    flash[:notice] = 'Update Personal Detail is Success'
  end

  def step2
    Rails.logger.debug "masuk step2"
    current_user.update_columns(onboard: 3)
    flash[:notice] = "Successfully updated profile"
  end

  # step3 update accounts
  def step3
    if current_user.update(step3_params)
      current_admin.update(onboard: :finish, status: :pending, set_pin: false)
      Rails.logger.debug(current_admin.errors.inspect)
      flash[:notice] = 'Welcome aboard'
    end
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    @participant = @event.participants.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.require(:participant).permit(:user_id, :participant_name, :participant_phone, :event_id, :participant_email, :participant_nationality, :participant_COR, :paticipant_NRIC, :participants_dob, :category_id, :shirt_size, :participant_gender)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_onboard_payment
    @onboard_payment = OnboardPayment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def onboard_payment_params
    params.require(:onboard_payment).permit(:onboard)
  end

end
