class Users::OnboardPaymentsController < ApplicationController
  before_action :get_event
  before_action :set_participant, only: %i[index update]

  def index
    if @participant.step0?
      @categories = Category.where(event_id: params[:event_id]).order(:category_name)
    elsif @participant.step1?
      @participants = @event.participants.find(params[:id])
      # redirect_to user_event_onboard_payments_path(@event)
    elsif @participant.step2?
      @participants = @event.participants.find(params[:id])
    elsif @participant.step3?
      @participants = @event.participants.find(params[:id])
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
      redirect_to authenticated_user_root_path
    elsif @participant.step3?
      params_api = {
        uid: "7638b54d-0adc-46b1-a1dc-7d469528a5a3",
        checksum: @participant.generate_checksum,
        buyer_email: @participant.participant_email,
        buyer_name: @participant.participant_name,
        buyer_phone: @participant.participant_phone,
        order_number: @participant.id,
        product_description: @event.event_name,
        transaction_amount: @participant.category.category_fees,
        callback_url: "",
        redirect_url: "http://localhost:3000/users/events/#{@event.id}/onboard_payments",
        token: "A64sFshdhzPmV5es_123",
        redirect_post: "true"
       }
      redirect_post('https://sandbox.securepay.my/api/v1/payments',            # URL, looks understandable
      params: params_api)
    else
      Rails.logger.debug @participant.errors.inspect
      redirect_to user_event_onboard_payments_path(id: @participant,event_id: @event)
    end
  end

  def create
    @participant = @event.participants.new(participant_params)

    respond_to do |format|
      if @participant.save
        @participant.update_columns(onboard: 1)
        format.html { redirect_to user_event_onboard_payments_path(id: @participant,event_id: @event), notice: "Create user Success" }
      else
        Rails.logger.debug @participant.errors.inspect
        format.html { redirect_to user_event_onboard_payments_path(event_id: @event), notice: "Failed to save"}
      end
    end
  end


  def step1
    Rails.logger.debug "step1 #{participant_params}"
    if @participant.update(participant_params)
      @participant.update_columns(onboard: 2)
    end
    Rails.logger.debug "step1 #{@participant.errors.inspect}"
    flash[:notice] = 'Update Personal Detail is Success'
  end

  def step2
    if @participant.update(participant_params)
      @participant.update_columns(onboard: 3)
    end
    Rails.logger.debug "step1 #{@participant.errors.inspect}"
    flash[:notice] = 'Update Personal Detail is Success'
  end

  # step3 update accounts
  def step3
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  def get_participant
    @participant = Participant.find_by(params[:current_user])
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    Rails.logger.debug "set_participant #{params}"
    if params[:id].present?
      @participant = @event.participants.find(params[:id])
    else
      @participant = @event.participants.new(user_id: current_user.id)
    end
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.require(:participant).permit(:user_id, :participant_name, :participant_phone, :event_id, :participant_email, :participant_nationality, :participant_COR, :participant_NRIC, :participants_dob, :category_id, :shirt_size, :participant_gender, :participant_postal, :participant_city, :participant_state, :shipping_attention, :shipping_address, :shipping_postal, :shipping_city, :shipping_state, :shipping_country)
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