class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :category


  enum onboard: [:step0, :step1, :step2, :step3, :finish]

  def generate_checksum
    data = "#{participant_email}|#{participant_name}|#{participant_phone}|#{""}|#{id}|#{event.event_name}|http://localhost:3000/payments/payredirect|#{category.category_fees}|#{"7638b54d-0adc-46b1-a1dc-7d469528a5a3"}"
    puts(data)
    checksum_token = "76e0e1b3d159e2f7ffc2547b25e6e82e7f7ed1ed093d44c46cc508729b80e2bf"
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
  end

  def CheckSum_generate(token = "no_token", **data)

	  data_sort_asc = data.sort_by {|k, v| k}
	  data_string = data_sort_asc.map {|k,v| v}.join("|")
    generate_checksum = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), token, data_string)
    return generate_checksum
  end


end
