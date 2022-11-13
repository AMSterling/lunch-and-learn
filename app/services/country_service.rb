class CountryService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_country(name)
    response = conn.get("/v3.1/name/#{name}?")
    parse = JSON.parse(response.body, symbolize_names: true).first
  end

  def self.get_random_country
    response = conn.get('/v3.1/all')
    results = JSON.parse(response.body, symbolize_names: true)
    results[0][:name][:common].parameterize(preserve_case: true)
  end
end
