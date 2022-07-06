class OnboardPaymentsController < ApplicationController
  before_action :get_event
  before_action :set_participant, only: %i[index update destroy]

  def index
    if @participant.step0?
      if params[:id].present?
        @participant = Participant.find(params[:id])
        @participants = Participant.where(parent_id: params[:id])
      end
      if params[:parent_id].present?
        @participants = Participant.where(parent_id: params[:parent_id])
        @participant = Participant.find(params[:id])
      end
      @categories = Category.where(event_id: params[:event_id], category_gender: "Male").order(:category_name)
      @categoriess = Category.where(event_id: params[:event_id], category_gender: "Female").order(:category_name)

    elsif @participant.step1?
      @participants = @event.participants.find(params[:id])

    elsif @participant.step2?
      @participant = @event.participants.find(params[:id])
      @participants = Participant.where(parent_id: params[:id])

    elsif @participant.finish?
      @participants = Participant.where(parent_id: params[:id])
      @receipt = params[:receipt]

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
    end

    if @participant.finish?
      ReceiptEventMailer.with(participant: @participant).post_created.deliver_now
      redirect_to root_path
    elsif @participant.step3?
      if @participant.update(participant_params)
        params_api = {
        uid: "7638b54d-0adc-46b1-a1dc-7d469528a5a3",
        checksum: @participant.generate_checksum,
        buyer_email: @participant.participant_email,
        buyer_name: @participant.participant_name,
        buyer_phone: @participant.participant_phone,
        order_number: @participant.id,
        product_description: @event.event_name,
        transaction_amount: @participant.participant_fees,
        callback_url: "",
        redirect_url: "http://#{ENV["domain"]}/payments/payredirect",
        token: "A64sFshdhzPmV5es_123",
        redirect_post: "true"
       }
      redirect_post('https://sandbox.securepay.my/api/v1/payments',            # URL, looks understandable
      params: params_api)
      end
    else
      Rails.logger.debug @participant.errors.inspect
      redirect_to event_onboard_payments_path(id: @participant,event_id: @event)
    end
  end

  def new
    @categories = Category.where(event_id: params[:event_id], category_gender: "Male").order(:category_name)
    @categoriess = Category.where(event_id: params[:event_id], category_gender: "Female").order(:category_name)


    if params[:parent_id].present?
      @categories = Category.where(event_id: params[:event_id], category_gender: "Male").order(:category_name)
      @categoriess = Category.where(event_id: params[:event_id], category_gender: "Female").order(:category_name)
      @participant = Participant.find(params[:parent_id])
      @participants = Participant.where(parent_id: params[:parent_id])

      @participantss = @event.participants.new(id: params[:parent_id])
    else
      @participant = @event.participants.new
    end
  end

  def create
    @participant = @event.participants.new(participant_params)

      if params[:continue]
        if params[:parent_id].present?
          Rails.logger.debug "there is parent here"
          if @participant.save
            @participant.update_columns(parent_id: params[:parent_id])
            Rails.logger.debug "participant parent updated"
            format.html { redirect_to event_onboard_payments_path(id: @participant,event_id: @event), notice: "Create user Success" }
          end
        end

        Rails.logger.debug "no parent detected"

        respond_to do |format|
          if @participant.save
            if !@participant.parent_id.nil?
              format.html { redirect_to event_onboard_payments_path(id: @participant.parent_id,event_id: @event), notice: "Create user Success" }
            else
              format.html { redirect_to event_onboard_payments_path(id: @participant,event_id: @event), notice: "Create user Success" }
            end
          end
        end

      else
        @participant = @event.participants.find(params[:id])
        respond_to do |format|
          if @participant.update
            @participant.update_columns(onboard: 1)
            format.html { redirect_to event_onboard_payments_path(id: @participant,event_id: @event), notice: "Create user Success" }
          else
            Rails.logger.debug @participant.errors.inspect
            format.html { redirect_to event_onboard_payments_path(event_id: @event), notice: "Failed to save"}
          end
        end
      end
  end

  def destroy
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to event_onboard_payments_path(id: @participant.parent_id,event_id: @event), notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def step0
    @participant.update_columns(onboard: 1)
    flash[:notice] = 'Update Personal Detail is Success'
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
    @participant.update_columns(onboard: 3)
    flash[:notice] = 'Update Personal Detail is Success'
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    Rails.logger.debug "set_participant #{params}"
    if params[:id].present?
      @participant = @event.participants.find(params[:id])
    elsif params[:parent_id].present?
      @participant = @event.participants.new(parent_id: params[:parent_id])
    else
      @participant = @event.participants.new
    end
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.require(:participant).permit(:user_id, :participant_name, :participant_phone, :event_id, :participant_email, :participant_nationality, :participant_COR, :participant_NRIC, :participants_dob, :category_id, :shirt_size, :participant_gender, :participant_postal, :participant_city, :participant_state, :shipping_attention, :shipping_address, :shipping_postal, :shipping_city, :shipping_state, :shipping_country, :parent_id, :participant_fees)
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