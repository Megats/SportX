class SearchController < ApplicationController

    def index
        @participants = Participant.all
        @participant = Participant.new
        @result = Participant.find_by(params[:participant_email])
    end

    def search
        @participant = Participant.find_by(params[:participant_email])
    end

    private

    def search_params
        params.require(:search).permit(:participant_email)
    end

end
