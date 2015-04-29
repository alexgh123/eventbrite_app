class AttendeesController < ApplicationController

  before_action :logged_in_user

  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])
  end

  def create
    @attendee = Attendee.create(attendee_params)
    # @event = Event.find(params[:event_id])
    if @attendee.save
      flash[:success] = "Attendee created!"
      redirect_to @attendee
    else
      flash[:failure] = "you are an idiot AND didn't create an attendee"
      redirect_to new_attendee_path
    end
  end

  def show
    @attendee = Attendee.find(params[:id])
  end


    private

      def attendee_params
        params.require(:attendee).permit(:user_id, :event_id)
      end

end
