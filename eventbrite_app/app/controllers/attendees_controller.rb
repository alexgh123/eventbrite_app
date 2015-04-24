class AttendeesController < ApplicationController

  before_action :logged_in_user

  def index
    @attendees = Attendee.all
  end
end
