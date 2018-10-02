class APIController < ApplicationController
  include Response
  include ExceptionHandler
  include ActionController::Serialization
end