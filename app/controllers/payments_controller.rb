class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only=>[:payredirect]
    # before_action :get_participant

    def payredirect
        Rails.logger.debug "MEGAT DERMA #{params}"
        # Rails.logger.debug "mencuba"
        # @participant.CheckSum_generate(token = "no_token", **data)
        # payment = params{json.parse}
        participant_status = params[:payment_status]
        @receipt = params[:status_url]
        @participant = Participant.find_by(participant_email: params[:buyer_email], participant_name: params[:buyer_name])
        Rails.logger.debug "status #{params[:payment_status]}"
        Rails.logger.debug @participant.inspect
        if participant_status == "true"
            @participant.update_columns(participant_status: "paid")
            Rails.logger.debug "Receipt url #{@receipt}"
            Rails.logger.debug "status is #{participant_status}"
            @participant.update_columns(data: @receipt)
            @participant.update_columns(onboard: 4)
            if !@participant.user_id.nil?
                Rails.logger.debug("user id is #{@participant.user_id}")
                Rails.logger.debug("this is user signed in")
                redirect_to user_event_onboard_payments_path(id: @participant.id,event_id: @participant.event_id,:receipt => @receipt)
            else
                Rails.logger.debug("this is public")
                redirect_to event_onboard_payments_path(id: @participant.id,event_id: @participant.event_id,:receipt => @receipt)
            end
        else
            Rails.logger.debug "status failed #{participant_status}"
            redirect_to user_event_onboard_payments_path(event_id: @participant.event_id)
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