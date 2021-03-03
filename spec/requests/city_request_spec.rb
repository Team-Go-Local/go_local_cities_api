require 'spec_helper'

RSpec.describe 'city request' do
  it 'returns a JSON response with the name of the nearest large city' do
    VCR.use_cassette('denver') do
      get '/api/v1/city', {coordinates: '39.7526184-105.0249216'}

      expect(last_response.status).to eq 200
      expect(last_response.header['Content-Type']).to eq('application/json')
      response = JSON.parse(last_response.body, symbolize_names: true)

      expect(response).to be_a(Hash)
      check_hash_structure(response, :data, Hash)
      check_hash_structure(response[:data], :id, NilClass)
      check_hash_structure(response[:data], :type, String)
      expect(response[:data][:type]).to eq('city')
      check_hash_structure(response[:data], :attributes, Hash)
      check_hash_structure(response[:data][:attributes], :name, String)
      check_hash_structure(response[:data][:attributes], :state, String)
      expect(response.keys).to match_array(%i[data])
      expect(response[:data].keys).to match_array(%i[id type attributes])
      expect(response[:data][:attributes].keys).to match_array(%i[name state])
    end
  end
end
