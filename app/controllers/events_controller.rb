class EventsController < ApplicationController
  include Auth
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all.order(:id)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    if event.save
      redirect_to events_path, notice: 'Event created.'
    else
      redirect_to new_event_path, inertia: { errors: event.errors }
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event was successfully updated.'
    else
      redirect_to edit_event_path(@event), inertia: { errors: @event.errors }
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :start_date)
  end
end
