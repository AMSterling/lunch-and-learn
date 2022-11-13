class UnsplashService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', params: { client_id: ENV['Access_Key'] })
  end

  def self.get_images(country)
    response = conn.get('/search/photos?page=1') do |f|
      f.params['query'] = country
      f.params['orientation'] = 'squarish'
    end
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
