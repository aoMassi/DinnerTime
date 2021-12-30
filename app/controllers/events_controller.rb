class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    def index
        @events = Event.all
    end

    def new
        @event = Event.new()
    end

    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save!
            redirect_to event_path(@event)
        else
            render :new 
        end
    end

    def show
        @review = Review.new(id: @event)

    end

    def edit

    end

    def update
        @event.update(event_params)
        redirect_to event_path(@event)

    end

    def destroy
        @event.destroy
        redirect_to event_path(@event)

    end

    def set_event
       @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:name, :location, :description, :cuisine_type, :price, :start_time, :end_time, :user)
    end
end
