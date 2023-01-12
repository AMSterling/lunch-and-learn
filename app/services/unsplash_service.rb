class UnsplashService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', params: { client_id: ENV['Unsplash_Access_Key'] })
  end

  def self.get_images(country)
    response = conn.get('/search/photos?page=1&orientation=squarish', { query: country })
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
