class CitiesController < Sinatra::Base
  get '/api/v1/city' do
    data = CitiesService.city_search(params[:coordinates])
    city = City.new(data[:data][0])
    content_type :json
    body CitySerializer.new(city).serialized_json
  rescue JSON::ParserError
    content_type :json
    body error_response
    status 404
  end

  private

  def error_response
    { errors: [
      'the request could not be completed',
      'external Cities API unavailable'
    ] }.to_json
  end
end
