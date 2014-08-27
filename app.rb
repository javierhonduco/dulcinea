require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/param'
require 'nebrija'
require './models/word'
require 'pinglish'
require 'metriks'
require 'json'

class App < Sinatra::Base
  helpers Sinatra::Param
  register Sinatra::ActiveRecordExtension  

  get '/' do
    send_file 'views/index.html'
  end
  
  get '/api/random' do
    param :type, String, required: true, in: ['day', 'random']

    type = params[:type]
    if type == 'day'
      time = Time.now.strftime("%Y%m%d").to_i * 100
      total = Word.count
      response = Word.find_by_id(time % total).data
    else
      offset = rand(Word.count)
      response = Word.find_by_id(offset).data
    end
    JSON.pretty_generate(response, :ascii_only=>true)
  end

  get '/api/' do
    content_type :json

    param :query, String, required: true
    query = params[:query]
    
    response = Word.find_by_word(query)
    if response.nil?
      response = HTTPRae.new.search(query)

      w = Word.new
      w.word = query
      w.data = response
      w.save

    else 
      response = response.data
    end
    JSON.pretty_generate(response, :ascii_only=>true)
  end

  get '/stats' do
    content_type :json

    JSON.pretty_generate({
      :total_records    => Word.count,
      :added_today      => Word.where(:defined_at => 1.day.ago..Time.now).count,
      :added_yesterday  => Word.where(:defined_at => 2.day.ago..1.day.ago).count,
    })
  end
  
  use Pinglish do |ping|
    ping.check :postgres, :timeout => 5 do
      !Word.nil?
    end
    ping.check :external_services, :timeout => 5 do
      !HTTPRae.new.search('_').nil?
    end
  end
end
