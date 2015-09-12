require 'sinatra/base'

class TestApp < Sinatra::Base
  # request path and (html) method
  # determine what method(controller) sinatra calls
  get '/' do 
  # sinatra responds with the methods return value
    erb :index 
  end

  post '/' do 
    # params is a hash containing the request parameters
    p params

    # @instance variables can be passed into the view
    # but not between controllers
    # as each request is a new instance.
    @name = "#{params[:firstname]} #{params[:lastname]}"

    # erb is a method that takes a symbol as it's argument
    # and finds and loads that file.
    # as it's a method (and we haven't made a new request)
    # we have access to the instance variables set
    # in this controller
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
