class GeoapifyService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['geoapify_key'] })
  end

  def self.get_sights(country)
    response = conn.get("/v2/places?categories=tourism.sights&filter=circle:#{country.lng},#{country.lat},20000")
    parse = JSON.parse(response.body, symbolize_names: true)[:features]
  end
end
