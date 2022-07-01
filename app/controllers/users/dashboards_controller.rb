class Users::DashboardsController < ApplicationController
  before_action :authenticate_user!

    def index
      @event = Event.where(event_status: "OPEN").count
      @events = Event.all.count
      @collaborations = Collab.all.count
      @users = User.all.count
      @numberparticipant = Participant.where(user_id: current_user.id).count
      @participants = Participant.where(user_id: current_user.id)
    end
  end
