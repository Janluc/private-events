class EventsController < ApplicationController
    def new 
        @event = Event.new
    end

    def create 
        @user = User.find(current_user.id)
        @user.events.build(event_params)
        if @user.save
            redirect_to @user
        else
            redirect_to new_event_url
        end

    end

    def show 
        @event = Event.find(params[:id])

    end

    def join
        @event = Event.find(params[:id])
        unless @event.attendees.include?(current_user)
          @event.attendees.push(current_user)
          redirect_to @event
        else
          redirect_to @event
        end
    end

    def index
    @event = Event.all
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date)
    end
end


