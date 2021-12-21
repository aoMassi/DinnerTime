class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = Event.new()
    end

    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save
            redirect_to event_path(@event)
        else
            render :new 
    end

    def show
        @event = Event.find(params[:id])

    end

    def edit
        @event = Event.find(params[:id])

    end

    def updated
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to event_path(@event)

    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to event_path(@event)

    end

    private

    def event_params
        params.require(@event).permit(:name, :location, :description, :cuisine_type, :price, :start_time, :end_time, :user)
    end
end
