module Dulcinea
  module Routes
    class Api < Sinatra::Application
      get 'test/' do
        'TESTTTT'
      end
    end
  end
end
