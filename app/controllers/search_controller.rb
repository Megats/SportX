class SearchController < ApplicationController
    
    def index
        @participants = []
       
        if params[:search]
          @participants = Participant.where(participant_email: params[:search][:participant_email])
        end

    end

    
end
