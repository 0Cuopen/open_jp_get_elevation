require "open_jp_get_elevation/version"
require 'net/http'
require 'json'

module OpenJpGetElevation
  class Error < StandardError; end
  # Your code goes here...
  def self.run(lat, lon)
    api_uri = URI.parse("https://cyberjapandata2.gsi.go.jp/general/dem/scripts/getelevation.php?lon=#{lon}&lat=#{lat}&outtype=JSON")
    addre_json = Net::HTTP.get(api_uri)
    addre_hash = JSON.parse(addre_json)

    if addre_hash.empty?
      'not found'
    else
      addre_hash['elevation']
    end
  end
end
