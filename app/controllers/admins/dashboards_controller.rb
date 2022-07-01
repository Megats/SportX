class Admins::DashboardsController < ApplicationController
before_action :authenticate_admin!

  def index
   
    if current_admin.as_admin?
      @events = Event.all.count
      @participants = Participant.all.count
      @collaborations = Collab.all.count
      @users = User.all.count
    else
      @events = current_admin.events.count
      @participants = Participant.all.count
      @collaborations = Collab.all.count
    end
  
  end
end
