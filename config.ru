require 'sinatra'
require 'async_sinatra'
require 'eventmachine'

class ExampleApp < Sinatra::Base
  register Sinatra::Async

  aget '/good' do
    ahalt 404
  end

  aget '/bad' do
    ahalt 404, "Sorry buddy, I don't know what you mean"
  end
end

class SomeMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    callback = env['async.callback']

    env['async.callback'] = Proc.new do |response|
      puts 'Request finished!'
      callback.call(response)
    end

    app.call(env)
  end
end

use SomeMiddleware
run ExampleApp
