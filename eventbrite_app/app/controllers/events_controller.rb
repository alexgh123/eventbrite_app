class EventsController < ApplicationController

  before_action :logged_in_user, only: [:show, :new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @attendee = Attendee.new
  end

  def show
    @event = Event.find(params[:id])
    @host = User.find(@event.user_id)


    @correct_attendees = Attendee.where(event_id: @event.id)

    # search each attendee item.
    # pick each attendee item whose attendee.user_id attribute = @event.id


    #               = find the attendees who have the right @event.id
    #               of those, display the name
    #               User.find(attendee.user_id).name
    # fidn the attendees where the attendee event id = @event.id
    # look at readme
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash[:failure] = "nope nothing created"
      redirect_to root_url
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :location)
    end

  # when i create an event, the current_user should provide the user_i

    # current_user.id = user_id
end
