require 'sinatra/activerecord'
require 'sinatra/base'
require 'nebrija'
require 'nebrija/version'
require './models/word'
require 'pinglish'
require 'json'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    send_file 'views/index.html'
  end

  get '/api/random/:type' do
    content_type :json

    type = params[:type] if ['day', 'random'].include?(params[:type])

    if type == 'day'
      time = Time.now.strftime("%Y%m%d").to_i * 100
      total = Word.count
      response = Word.find_by_id(time % total).data
    else
      offset = rand(Word.count)
      response = Word.find_by_id(offset).data
    end
    JSON.pretty_generate(response, ascii_only: true)
  end

  get '/api/word/:word' do
    content_type :json

    response = Rae.new.search(params[:word])
    version_metadata = { nebrija_version: Nebrija::VERSION }
    JSON.pretty_generate(response.merge(version_metadata), ascii_only: true)
  end

  get '/api/stats' do
    content_type :json

    JSON.pretty_generate({
      total_records:    Word.count,
      added_today:      Word.where(defined_at: 1.day.ago..Time.now).count,
      added_yesterday:  Word.where(defined_at: 2.day.ago..1.day.ago).count,
    })
  end

  use Pinglish do |ping|
    ping.check :postgres, timeout: 5 do
      !Word.nil?
    end
    ping.check :external_services, timeout: 5 do
      !Rae.new.search('_').nil?
    end
  end
end
