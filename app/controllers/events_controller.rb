class EventsController < ApplicationController
  include Auth

  before_action :set_event, only: %i[ show edit update ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    # render inertia: 'events/new'
    @event = Event.new
  end

  def create
    event = Event.new(event_params)

    if event.save
      redirect_to events_path, notice: 'event created.'
    else
      redirect_to new_event_path, inertia: { errors: event.errors }
    end
  end

  def edit
    formatted_start_date = @event.start_date.strftime('%Y-%m-%dT%H:%M') if @event.start_date
    render inertia: 'events/edit', props: {
      event: @event.as_json(
        only: [:id, :title, :description, :start_date]
      ).merge(start_date: formatted_start_date)
    }
  end


  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event was successfully updated.'
    else
      redirect_to edit_event_path(@event), inertia: { errors: @event.errors }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date)
  end
end
