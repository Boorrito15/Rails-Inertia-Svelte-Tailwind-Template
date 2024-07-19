class EventsController < ApplicationController
  use_inertia_instance_props

  def index
    @events = Event.all
  end
end
