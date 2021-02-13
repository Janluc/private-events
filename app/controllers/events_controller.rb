class EventsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @event = @user.events.build
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.events.build(event_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def join
    @event = Event.find(params[:id])
    @event.attendees.push(current_user) unless @event.attendees.include?(current_user)
    redirect_to @event
  end

  def index
    @event = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
