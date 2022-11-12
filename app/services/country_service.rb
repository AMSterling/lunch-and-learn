class CountryService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_country(name)
    response = conn.get("/v3.1/name/#{name}?fullText=true")
    parse = JSON.parse(response.body, symbolize_names: true).first
  end

  def self.get_random_country
    response = conn.get('/v3.1/all')
    parse = JSON.parse(response.body, symbolize_names: true).shuffle.take(1)
    parse[0][:name][:common]
  end
end
