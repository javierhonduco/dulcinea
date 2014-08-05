require 'json'

class Stats
  def initialize(app)
    @app = app
  end

  def call(env)

    timer = Metriks.timer('http')
    timer.time do
       @status, @headers, @response = @app.call(env)
    end

    counter = Metriks.counter("http.status_code.#{@status}")
    counter.increment

    response_type = 'json'
    if (@headers['Content-Type'] =~/json/).nil?
      response_type = 'html'
    end
    counter = Metriks.counter("http.response.#{response_type}")
    counter.increment
    
    
    [@status, @headers, @response]
  end
end
