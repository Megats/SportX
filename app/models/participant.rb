class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :category

  enum onboard: [:step0, :step1, :step2, :step3, :finish]

  def generate_checksum
    data = "#{participant_email}|#{participant_name}|#{participant_phone}|#{""}|#{id}|#{event.event_name}|http://localhost:3000/payments/payredirect|#{participant_fees}|#{"7638b54d-0adc-46b1-a1dc-7d469528a5a3"}"
    puts(data)
    checksum_token = "76e0e1b3d159e2f7ffc2547b25e6e82e7f7ed1ed093d44c46cc508729b80e2bf"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
  end

  def self_search
    if search
      participant = Participant.find_by(participant_email: params[:search])
      if participant_name
        self.where(participant_name: params[:search])
      else
        Participant.all
      end
    else
      Participant.all
    end
  end

end
