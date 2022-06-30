class OnboardPaymentsController < ApplicationController
  before_action :set_onboard_payment, only: %i[ show edit update destroy ]
  before_action :get_event
  before_action :set_participant, only: %i[index update]

  def index
    if @participant.step0?
      @categories = Category.where(event_id: params[:event_id]).order(:category_name)
    else
      # redirect_to user_event_onboard_payments_path(@event)
    end
  end

  def register
    @event = Event.find(params[:event_id])
    @categories = Category.where(event_id: params[:event_id]).order(:category_name)
  end

  def update
    if @participant.step0?
      step0
    elsif @participant.step1?
      step1
    elsif @participant.step2?
      step2
    elsif @participant.step3?
      step3
    elsif @participant.step4?
      step4
    end

    if @participant.finish?
      redirect_to root_path
    else
      Rails.logger.debug @participant.errors.inspect
      redirect_to event_onboard_payments_path(@event)
    end
  end

  def create
    @participant = @event.participants.new(participant_params)

    if @participant.save
      @participant.update_columns(onboard: 1)
    end
    redirect_to event_onboard_payments_path(id: @participant,event_id: @event)
    Rails.logger.debug "step0 #{@participant.errors.inspect}"
    flash[:notice] = 'Update Personal Detail is Success'
  end


  def step1
    Rails.logger.debug "MERGEE #{participant_params}"
    if @participant.create(participant_params)
      @participant.update_columns(onboard: 2)
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
      current_user.update(onboard: :finish, status: :pending, set_pin: false)
      Rails.logger.debug(current_admin.errors.inspect)
      flash[:notice] = 'Welcome aboard'
    end
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  def get_participant
    @participant = Participant.find_by(params[:id])
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    Rails.logger.debug "set_participant #{params}"
    if params[:id].present?
      @participant = @event.participants.find(params[:id])
    else
      @participant = @event.participants.new
    end
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.require(:participant).permit(:participant_name, :participant_phone, :event_id, :participant_email, :participant_nationality, :participant_COR, :participant_NRIC, :participants_dob, :category_id, :shirt_size, :participant_gender)
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