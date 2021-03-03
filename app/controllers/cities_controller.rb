class CitiesController < Sinatra::Base
  get '/api/v1/city' do
    data = CitiesService.city_search(params[:coordinates])
    city = City.new(data[:data][0])
    content_type :json
    body CitySerializer.new(city).serialized_json
  end
end
