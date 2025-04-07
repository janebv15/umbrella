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
pp geo


pp resp
#Get lat and lon from google

#get weather from pirate AI based on coordinates
pp pirate_weather = "https://api.pirateweather.net/forecast/#{ENV.fetch("PIRATE_KEY")}/#{latitude},#{longitude}"

#Display current temperature etc for next hour
