class GeoapifyService
  def self.get_sights(country)
    response = conn.get('/v2/places?') do |faraday|
      faraday.params['categories'] = 'tourism.sights'
      faraday.params['conditions'] = 'named'
      faraday.params['filter'] = "circle:#{country.lng},#{country.lat},20000"
      faraday.params['bias'] = "proximity:#{country.lng},#{country.lat}"
      faraday.params['limit'] = 20
    end
    parse(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['geoapify_key'] })
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)[:features]
  end
end
