class GeoapifyService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['geoapify_key'] })
  end

  def self.get_sights(lnglat)
    response = conn.get('/v2/places?categories=tourism.sights', { filter:  })
    JSON.parse(response.body, symbolize_names: true)[:hits].take(10)
  end
end
