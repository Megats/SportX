class Users::DashboardsController < ApplicationController
  before_action :authenticate_user!

    def index
      @events = Event.all.count
      @participants = Participant.all.count
      @collaborations = Collab.all.count
      @users = User.all.count
    end
  end
