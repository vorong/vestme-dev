class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with :name => "fafmode", :password => "pw123go"
end
