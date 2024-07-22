class EventsController < ApplicationController
  include Auth

  # before_action :set_event, only: %i[ show ]

  def index
    @events = Event.all
  end

  def show
    event = Event.find(params[:id])
    render inertia: 'Events/Show', props: {
      event: event.as_json(
        only: [:id, :title, :start_date, :description]
      )
    }
  end

  private

  # def set_event
  #   @event = Event.find(params[:id])
  # end
end
