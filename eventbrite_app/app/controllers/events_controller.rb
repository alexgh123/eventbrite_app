class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id).name


  end

  def create
    @event = Event.create(event_params)
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
end
