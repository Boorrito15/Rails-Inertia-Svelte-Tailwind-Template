class EventsController < ApplicationController
  include Auth

  def index
    @events = Event.all
  end
end
