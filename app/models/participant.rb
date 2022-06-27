class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def generate_checksum
 
    
    data = "#{participant_email}|#{paticipant_NRIC}|#{participant_nationality}|#{""}|#{id}|#{event.event_name}|#{""}|#{event.event_price}|#{"e7c5d7eb-3707-4a0b-9f79-5f015941adf7"}"
    puts(data)
    checksum_token = "6d6a89340596f76a0b2ab67bdac31e27d36a30861be194b37d564a6f07c86633"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)

  end
end
