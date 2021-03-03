class CitySerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :name, :state
end
