class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # won't need to do any change in your controllers except defining the serializer method
  def render(options = {})
    options[:json] = serializer.new(options[:json]).serialized_json
    super(options)
  end
end
