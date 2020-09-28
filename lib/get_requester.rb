
require 'net/http'
require 'open-uri'
require 'pry'

class GetRequester
  
  URL = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"
  
  def initialize(site)
    @site = site
  end 
  
  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body 
  end
  
  def parse_json
    programs = JSON.parse(get_response_body)
    programs.collect do |program|
      program["agency"]
    end 
    programs
  end

end
