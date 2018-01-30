desc 'find lat/lng for listings with nil lat'       #this is required to run outsideboundingbox? method
task :geocode => :environment do

  require 'open-uri'
  require 'json'
  
  Listing.where(lat: nil).find_each do |listing|
    
    address = listing.address
    address = address.gsub!(/\s/,'+') #replaces spaces with +
    key = "AIzaSyAO4qqrZroxOzWDPPK0Ra2EcXmvrZZM3j0"
    puts address
    uri = URI.parse(URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{key}"))
    if file_handle = open(uri)
      parsed_json = JSON.load(file_handle)
      if parsed_json["results"].present?
        results = parsed_json["results"]
        puts "class: #{results.class} count: #{results.count}"
        if results.count > 0
          results_hash = results.first
          geometry = results_hash["geometry"]
          location = geometry["location"]
          lat = location["lat"]
          lng = location["lng"]
          listing.lat = lat
          listing.lng = lng
          listing.save
        else
          puts "0 RESULTS_HASH"
        end
      else
        puts "NO RESULTS"
      end  
    else
      puts "No URL"
    end
  end #Listing do
    
end