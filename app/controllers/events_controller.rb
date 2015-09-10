class EventsController < ApplicationController
  
  before_filter :require_login

  def show
    @event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event

    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :time,
                                   :location)
    end
    def require_login
      unless current_user
        redirect_to login_path
      end
    end
end
