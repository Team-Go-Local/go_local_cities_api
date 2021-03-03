class City
  attr_reader :name, :state

  def initialize(data)
    @name = data[:name]
    @state = data[:regionCode]
  end
end
