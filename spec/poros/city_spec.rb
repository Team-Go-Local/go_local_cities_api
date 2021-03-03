require 'spec_helper'

RSpec.describe City do
  it 'exists and has attributes' do
    data = {
      "id": 126527,
      "wikiDataId": "Q49258",
      "type": "CITY",
      "city": "Colorado Springs",
      "name": "Colorado Springs",
      "country": "United States of America",
      "countryCode": "US",
      "region": "Colorado",
      "regionCode": "CO",
      "latitude": 38.863333333,
      "longitude": -104.791944444,
      "distance": 62.69
    }
    city = City.new(data)

    expect(city).to be_a(City)
    expect(city).to have_attributes(name: data[:name], state: data[:regionCode])
  end
end
