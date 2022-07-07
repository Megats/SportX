class Users::ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_event
  before_action :set_participant, only: %i[ show edit update destroy ]

  # GET /participants or /participants.json
  def index
    @participants = @event.participants.all
  end

  # GET /participants/1 or /participants/1.json

  # GET /participants/new
  def new
    @participant = @event.participants.new
  end

  # GET /participants/1/edit
  def edit
  end

  def show
    @participants = Participant.where(parent_id: @participant.id)
  end

  # POST /participants or /participants.json
  def create
    @participant = @event.participants.new(participant_params)

    if @participant.save


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
        redirect_url: "",
        token: "A64sFshdhzPmV5es_123",
        redirect_post: "true"
       }

      redirect_post('https://sandbox.securepay.my/api/v1/payments',            # URL, looks understandable
        params: params_api)
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to user_event_participant_url(@participant), notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
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
      params.require(:participant).permit(:user_id, :participant_name, :participant_phone, :event_id, :participant_email, :participant_nationality, :participant_COR, :participant_NRIC, :participants_dob, :category_id, :shirt_size)
    end
end
