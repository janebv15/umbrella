# Write your solution below!
require "http"
require "json"
require "dotenv/load"

#ruby do_not_peek_possible_solution.rb

#Ask user for location
pp "Where are you located?"

#Get and store location
#user_location = gets.chomp

# pp user_location
user_location = "Seattle"
maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"


resp = HTTP.get(maps_url)

raw_response = resp.to_s


parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)
geo = first_result.fetch("geometry")

loc = geo.fetch("location")

pp latitude = loc.fetch("lat")
pp longitude = loc.fetch("lng")
geo


resp
#Get lat and lon from google

#get weather from pirate AI based on coordinates
pirate_weather = "https://api.pirateweather.net/forecast/#{ENV.fetch("PIRATE_KEY")}/#{latitude},#{longitude}"

P_resp = HTTP.get(pirate_weather)
P_raw_response = P_resp.to_s

P_parsed_response = JSON.parse(P_raw_response)

currently_hash = P_parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "It is currently #{current_temp}°F."

#Display current temperature etc for next hour
