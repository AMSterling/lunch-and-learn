class Country
  attr_reader :id, :name, :capital, :lng, :lat

  def initialize(data)
    @id = nil
    @name = data[:name][:common]
    @capital = data[:capital][0]
    @lng = data[:capitalInfo][:latlng][1]
    @lat = data[:capitalInfo][:latlng][0]
  end
end
