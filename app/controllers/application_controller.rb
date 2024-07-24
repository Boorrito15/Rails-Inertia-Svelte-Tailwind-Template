class ApplicationController < ActionController::Base
  use_inertia_instance_props
  include InertiaCsrf

  inertia_share auth: -> {
    if user_signed_in?
      {
        user: {
          id: current_user.id,
          email: current_user.email,
          first_name: current_user.first_name,
          last_name: current_user.last_name
        }
      }
    else
      {
        user: nil
      }
    end
  }
end
