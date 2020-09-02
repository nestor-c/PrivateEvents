class EventsController < ApplicationController
    def index
        @events = Event.all
        @upcoming_events = Event.upcoming_events.all
        @past_events = Event.past_events.all
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
           @past_events = current_user.past_events
           @upcoming_events = current_user.upcoming_events
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