class EventsController < ApplicationController
  include Auth

  before_action :set_event, only: %i[ show ]

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

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date)
  end
end
