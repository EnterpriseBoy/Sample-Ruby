require 'open-uri'
require 'json'


def office_location
  apiKey =  'AIzaSyC5KvElpTjIwg8-z2RkUsL-Agfbt023qlE'
  puts "Please enter your city name :"
  city_name = gets
  city_name = city_name.chomp

  puts "Please enter your company name :"
  company_name = gets
  company_name = company_name.chomp


  #URI that will be opened 
  request_uri = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" +company_name+"+in+"+city_name+"&key="+apiKey.to_s 
  #Results from the URI
  uri_results = open(request_uri).read
  #Parsing the results to JSON
  json_results= JSON.parse(uri_results)
  json_results["results"].each do |company_list|
    #puts "Comapny Name:              "+company_list["name"].to_s
    #puts "Comapny Address:           "+company_list["formatted_address"].to_s
    #puts "Comapny Address Latitude:  "+company_list["geometry"]["location"]["lat"].to_s
    #puts "Comapny Address Longitude:  "+company_list["geometry"]["location"]["lng"].to_s
    array_to_return = Array.new
    array_to_return << company_list["geometry"]["location"]["lat"]
    array_to_return << company_list["geometry"]["location"]["lng"]
    return array_to_return
  end
end


def distance loc1, loc2
  #Taken from stackoverflow address below
  #http://stackoverflow.com/questions/12966638/how-to-calculate-the-distance-between-two-gps-coordinates-without-using-google-m
  rad_per_deg = Math::PI/180  # PI / 180
  rkm = 6371                  # Earth radius in kilometers
  rm = rkm * 1000             # Radius in meters

  dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
  dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

  lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
  lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

  a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  rm * c # Delta in meters
end

def open_file file_name
  master_array = Array.new
  File.open(file_name,'r') do |file|
    file.each do |individual_line|
      json_results = JSON.parse(individual_line)
      customer_array = Array.new
      customer_array <<  json_results["name"]
      customer_array << json_results["user_id"]
      customer_array <<  json_results["latitude"]
      customer_array <<  json_results["longitude"]
      master_array << customer_array
    end
  end
  return master_array
end

office_location = office_location()
final_array = Array.new
open_file('gistfile1.txt').each do |test|
  if (distance( [test[2].to_f,test[3].to_f], office_location)) /1000 < 100#Distance from the office
    customer_details = Array.new
    customer_details.push(test[1].to_i) #Customer ID. Will be sorted by this
    customer_details.push (test[0].to_s) #Customer Name Will
    final_array.push(customer_details) #Adding customer details to the final array
  end
end
final_array.sort_by{|x|x}.reverse.each do |party_person|
  puts party_person.to_s
end


   