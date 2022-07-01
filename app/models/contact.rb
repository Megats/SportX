class Contact < MailForm::Base
    attribute :name_contact, :validate => true
    attribute :email_contact, :validate => /\A[^@\s]+@[^@\s]+\z/i
    attribute :message_contact, :validate => true
    attribute :nickname, captcha: true    


    def headers 
        {
        :subject => "Contact Form",
        :to => "xbot5757@gmail.com",
        :from => %("#{name_contact}" <#{email_contact}>)
    }
    end
end