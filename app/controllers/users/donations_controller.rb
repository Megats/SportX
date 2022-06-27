class Users::DonationsController < ApplicationController
  before_action :set_donation, only: %i[ show edit update destroy ]
  before_action :get_collab

  # GET /donations or /donations.json
  def index
    @donations = @collab.donations.all
  end

  # GET /donations/1 or /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = @collab.donations.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations or /donations.json
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      params_api = {
        uid: "7638b54d-0adc-46b1-a1dc-7d469528a5a3",
        checksum: @donation.generate_checksum,
        buyer_email: @donation.donation_email,
        buyer_name: @donation.donation_name,
        buyer_phone: @donation.donation_number,
        order_number: @donation.donation_NRIC,
        product_description: @donation.collab_id,
        transaction_amount: @donation.donation_amount,
        callback_url: "",
        redirect_url: "",
        token: "A64sFshdhzPmV5es_123",
        redirect_post: "true"
       }

      redirect_post('https://sandbox.securepay.my/api/v1/payments',            # URL, looks understandable
        params: params_api)
    end

    # respond_to do |format|
    #   if @donation.save
        # format.html { redirect_to user_collab_donation_url(@collab, @donation), notice: "Donation was successfully created." }
        # format.json { render :show, status: :created, location: @donation }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @donation.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /donations/1 or /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to user_collab_donation_url(@donation), notice: "Donation was successfully updated." }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1 or /donations/1.json
  def destroy
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to user_collab_donations_url, notice: "Donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_collab
      @collab = Collab.find(params[:collab_id])
    end

    def get_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.require(:donation).permit(:user_id, :donation_name, :collab_id, :donation_email, :donation_number, :donation_nationality, :donation_COR, :donation_NRIC, :donation_dob, :donation_amount)
    end
end
