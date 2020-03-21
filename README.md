## Fetch SupportColumbusEats Airtable and convert the data into JSON


### Setup
Make sure you have a recent version of Ruby installed, this project was build using Ruby 2.5
and make sure `bundler` is installed, `gem install bundler`


1. Clone repo
2. cd `cbuseats-json-api`
3. `bundle install`
4. Ensure you have an Airtable API key and that you have read access to the supportcbuseats Airtable


### Running the command
1. Run the following command: `AIRTABLE_API_KEY=xxxxx ruby fetch_airtable_data.rb > restaurants.json`
2. Commit changes to `restaurant.json` and push to heroku

