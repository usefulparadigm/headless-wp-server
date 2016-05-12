# wp_api.rb
require "rest-client"

# WP REST API
# http://v2.wp-api.org/

class WpApi
  attr_reader :endpoint
  
  BASE_PATH = "/wp-json"
  RESOURCE_PREFIX = "/wp/v2"

  def initialize(site_url)
    @endpoint = URI.join(site_url, BASE_PATH)
  end

  # wp.get(:posts, :per_page => 1) ==> GET /wp/v2/posts?per_page=1 
  def get(name, args={})
    response = RestClient.get(route(name), params: args)
    JSON.parse(response, symbolize_names: true)
  rescue
    nil
  end
  
  def post(name, args={})
    raise NotImplementedError
  end

  private
  
  def route(name)
    "#{endpoint}#{RESOURCE_PREFIX}/#{name}"
  end

end

# Test
# wp = WpApi.new("http://localhost:8080/")
# wp.get(:posts)
# wp.get(:posts, :_embed => true)
# wp.get(:posts, :per_page => 1)
# wp.get("posts/2")
