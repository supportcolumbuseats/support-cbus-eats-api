require 'airrecord'

AIRTABLE_API_KEY = ENV["AIRTABLE_API_KEY"]
BASE = "appwweCl8Lnfbf9Vs"

utf8 = Encoding.find("UTF-8")

districts_by_id = Airrecord.table(AIRTABLE_API_KEY, BASE, "City Districts").all.inject({}) do |result, record|
  result[record.id] = record.fields["Name"]
  result
end

restaurants = Airrecord.table(AIRTABLE_API_KEY, BASE, "Restaurants").all.map(&:fields).map do |fields|
  # clean up keys
  fields.transform_keys! do |key|
    key.encode(utf8).downcase.gsub(/[^\s\w]+/, "").strip.gsub(/\s+/, "_").to_sym
  end

  # districts are in a separate table, map district ID to get district name
  fields[:district] = fields[:district]&.map {|district_id| districts_by_id[district_id] }&.first

  # removing, front-end client probably doesn't need this cache value
  fields.delete(:cache)
  fields
end


File.open(File.join(File.dirname(__FILE__), 'tmp', 'restaurants.json'),"w") do |f|
  f.write(restaurants.to_json)
end
