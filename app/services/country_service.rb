class CountryService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.get_country(name)
    response = conn.get("/v3.1/name/#{name}")
    parse = JSON.parse(response.body, symbolize_names: true)
  end
end
