class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only=>[:payredirect]
    # before_action :get_participant

    def payredirect
        Rails.logger.debug "MEGAT DERMA #{params}"
        user = User.find_by(email: params[:buyer_email])
        Rails.logger.debug(user)
        participant_status = params[:payment_status]
        @receipt = params[:status_url]
        @participant = Participant.find_by(participant_email: params[:buyer_email], participant_name: params[:buyer_name])
        if participant_status == "true"
            @participant.update_columns(participant_status: "registered")
            @participant.update_columns(data: @receipt)
            @participant.update_columns(onboard: 4)
            if !@participant.user_id.nil?
                sign_in(user) if user.present?
                Rails.logger.debug("user id is #{@participant.user_id}")
                redirect_to user_event_onboard_payments_path(id: @participant.id,event_id: @participant.event_id,parent_id: @participant.id), notice: "Payment Success!"
            else
                Rails.logger.debug("this is public")
                ReceiptEventMailer.with(participant: @participant).post_created.deliver_now
                redirect_to event_onboard_payments_path(id: @participant.id,event_id: @participant.event_id), notice: "Payment Success!"
            end
        else
            Rails.logger.debug "status failed #{participant_status}"
            redirect_to event_onboard_payment_register_path(@participant.event_id, :event_id => @participant.event_id), alert: "Payment Unsuccessful!"
            flash[:alert] = 'Payment Failed!'
        end

        # MEGAT DERMA {
        # "payment_status"=>"true",
        # "transaction_fee"=>"1.50",
        # "order_number"=>"40",
        # "merchant_reference_number"=>"ULDYE1656661277",
        # "exchange_number"=>"ULDYE1656661277",
        # "payment_id"=>"16163",
        # "status_url"=>"https://sandbox.securepay.my/api/v1/status/ULDYE1656661277?uid=a0063fa2f8dbed4e0f97",
        # "checksum"=>"026320cc75de6bdf86c172fb2520ef2db43587d2ef92aeffb69d193d1f0c12cf",
    end

    private

    # def get_participant
    #     @participant = Participant.find(params[:id])
    # end
end