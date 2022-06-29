class Donation < ApplicationRecord
  belongs_to :collab

  def generate_checksum
    
    data = "#{donation_email}|#{donation_name}|#{donation_number}|#{""}|#{donation_NRIC}|#{collab_id}|#{""}|#{donation_amount}|#{"7638b54d-0adc-46b1-a1dc-7d469528a5a3"}"
    puts(data)
    checksum_token = "76e0e1b3d159e2f7ffc2547b25e6e82e7f7ed1ed093d44c46cc508729b80e2bf"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)

  end

end
