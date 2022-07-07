class DonationpaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only=>[:donationredirect]
    def donationredirect
        
       
        @donation = Donation.find_by(donation_email: params[:buyer_email], donation_name: params[:buyer_name])
        if params[:payment_status] = "true"
            if !@donation.user_id.nil?
                user = User.find_by(email: params[:buyer_email])
                sign_in(user) if user.present?
            
                redirect_to user_collab_donation_successful_path(collab_id: @donation.collab_id, donation_id: @donation.id), notice: "Payment Success!"
            else
            #     Rails.logger.debug("this is public")
                redirect_to collab_donation_successful_path(collab_id: @donation.collab_id, donation_id: @donation.id), notice: "Payment Success!"
            end
        else
            if !@donation.user_id.nil?
                redirect_to user_collab_donation_unsuccessful_path(donation_id: @donation.id ,collab_id: @donation.collab_id), notice: "Payment Unsuccessful!"
            else
                redirect_to collab_donation_unsuccessful_path(donation_id: @donation.id ,collab_id: @donation.collab_id), notice: "Payment Unsuccessful!"
            end   
           
    
        end
    end
end
