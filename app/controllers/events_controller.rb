class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new();
    end

    def show
        @event = Event.find_by_id(params[:id])
    end

    def create
        if current_user
           @event = current_user.events.build(event_params)
            if @event.save
                flash[:success] = "Event created!"
                redirect_to events_path;
            else
                flash[:error]= @event.errors.messages
                render "events/new"
            end
        end
    end

    private
        def event_params
            params.require(:event).permit(:title, :location, :date, :description)
        end
end