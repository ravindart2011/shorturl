class ApplicationController < ActionController::Base

  ## Returns ip location for development environment
  def lookup_ip_location
    if Rails.env.development?
      Geocoder.search(request.remote_ip).first
    else
      request.location
    end
  end
  
end
