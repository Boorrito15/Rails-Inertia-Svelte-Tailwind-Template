class ApplicationController < ActionController::Base
  use_inertia_instance_props
  include InertiaCsrf

  inertia_share auth: -> {
    if user_signed_in?
      {
        user: current_user.email
      }
    end
  }
end
