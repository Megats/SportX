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

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)

    if @payment.save
      Rails.logger.debug("loading checksum #{@participant.generate_checksum}")
      
      params_api = {
        uid: "e7c5d7eb-3707-4a0b-9f79-5f015941adf7",
        checksum: @participant.generate_checksum,
        buyer_email: @participant.buyer_email,
        buyer_name: @participant.buyer_name,
        buyer_phone: @participant.buyer_phone,
        order_number: @participant.id,
        product_description: @event.event_name,
        transaction_amount: @event.event_price,
        callback_url: "",
        redirect_url: "",
        token: "osjbg2SM9p1q4v-PyYqb",
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
    def get_user
      @user = User.find(params[:user_id])
    end
    def get_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:user_id, :event_id, :participant_email, :participant_nationality, :participant_COR, :paticipant_NRIC, :participants_dob, :participant_category)
    end
end
