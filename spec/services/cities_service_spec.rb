require 'spec_helper'

RSpec.describe CitiesService do
  it 'gets the nearest city using a set of geographical coordinates' do
    coordinates = 39.7526184-105.0249216

    city_info = CitiesService.city_search(coordinates)

    expect(city_info).to be_a(Hash)
    check_hash_structure(city_info, :data, Array)
    city = city_info[:data][0]
    expect(city).to be_a(Hash)
    check_hash_structure(city, :name, String)
    expect(city[:name]).to eq("Denver")
    check_hash_structure(city, :regionCode, String)
    expect(city[:regionCode]).to eq("CO")
  end

  it 'can get a different city' do
    coordinates = 29.9754713-90.0851898

    city_info = CitiesService.city_search(coordinates)

    expect(city_info).to be_a(Hash)
    check_hash_structure(city_info, :data, Array)
    city = city_info[:data][0]
    expect(city).to be_a(Hash)
    check_hash_structure(city, :name, String)
    expect(city[:name]).to eq("New Orleans")
    check_hash_structure(city, :regionCode, String)
    expect(city[:regionCode]).to eq("LA")
  end
end
