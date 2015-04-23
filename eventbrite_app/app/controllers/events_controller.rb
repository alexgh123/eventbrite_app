class EventsController < ApplicationController

  before_action :logged_in_user, only: [:show, :new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
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
