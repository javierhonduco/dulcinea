require 'nebrija'
require 'nebrija/version'
require 'pinglish'

class App < Sinatra::Base
  get '/' do
    send_file 'views/index.html'
  end

  get '/api/word/:word' do
    content_type :json

    response = Rae.search(params[:word])
    version_metadata = { nebrija_version: Nebrija::VERSION }

    JSON.pretty_generate(response.merge(version_metadata), ascii_only: true)
  end

  use Pinglish do |ping|
    ping.check :rae, timeout: 15 do
      !Rae.search('cede').nil?
    end
  end
end
