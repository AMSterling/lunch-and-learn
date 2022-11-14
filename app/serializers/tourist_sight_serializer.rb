class TouristSightSerializer
  include JSONAPI::Serializer

  def self.new(sights)
    {
      data: sights
    }
  end

end
