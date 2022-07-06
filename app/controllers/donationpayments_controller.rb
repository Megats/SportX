class DonationpaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only=>[:donationredirect]
    def donationredirect
        Rails.logger.debug "MEGAT DERMA #{params}"
        # Rails.logger.debug "mencuba"
        # @participant.CheckSum_generate(token = "no_token", **data)
        # payment = params{json.parse}
        user = User.find_by(email: params[:buyer_email])
        sign_in(user) if user.present?
        donation_status = params[:payment_status]
        @donation = Donation.find_by(donation_email: params[:buyer_email], donation_name: params[:buyer_name])
        if donation_status == "true"
            # @participant.update_columns(participant_status: "registered")
            if !@donation.user_id.nil?
            #     Rails.logger.debug("user id is #{@donation.user_id}")
            #     Rails.logger.debug("this is user signed in")
                redirect_to user_collab_donation_successful_path(collab_id: @donation.collab_id, donation_id: @donation.id), notice: "Payment Success!"
            else
            #     Rails.logger.debug("this is public")
                redirect_to collab_donation_successful_path(collab_id: @donation.collab_id, donation_id: @donation.id), notice: "Payment Success!"
            end
        else
        #     Rails.logger.debug "status failed #{participant_status}"
            redirect_to user_collab_donation_unsuccessful_path(donation_id: @donation.id ,collab_id: @donation.collab_id), notice: "Payment Unsuccessful!"
        #     flash[:notice] = 'Payment Failed!'
        end
    end
end
