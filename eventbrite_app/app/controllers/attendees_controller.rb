class AttendeesController < ApplicationController

  before_action :logged_in_user

  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      flash[:success] = "Attendee created!"
      redirect_to @attendee
    else
      flash[:failure] = "you are an idiot AND didn't create an attendee"
      redirect_to new_attendee_path
    end
  end


    private

      def attendee_params
        params.require(:attendee).permit(:user_id, :event_id)
      end

end
