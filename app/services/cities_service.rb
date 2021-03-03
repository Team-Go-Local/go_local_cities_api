class CitiesService
  class << self
    def city_search(coordinates)
      response = conn.get do |req|
        req.params['location'] = coordinates
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      @conn ||= Faraday.new("https://wft-geo-db.p.rapidapi.com/v1/geo/cities") do |req|
        req.headers['x-rapidapi-key'] = ENV['CITIES_API_KEY']
        req.params['minPopulation'] = 300000
        req.params['radius'] = 100
        req.params['types'] = 'CITY'
        req.params['limit'] = 1
      end
    end
  end
end
