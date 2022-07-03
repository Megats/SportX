class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
            flash.now[:success] = 'sent'
        else
            flash.now[:error] = 'Cannot send message please try again.'
            render :new
        end 
    end
end
