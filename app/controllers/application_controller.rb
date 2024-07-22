class ApplicationController < ActionController::Base
  use_inertia_instance_props
  include InertiaCsrf
end
