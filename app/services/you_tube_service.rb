class YouTubeService
  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com', params: { key: ENV['YouTube_API'] })
  end

  def self.get_videos(country)
    response = conn.get('/youtube/v3/search?part=snippet&maxResults=10') do |f|
      f.params['q'] = country
    end
    JSON.parse(response.body, symbolize_names: true)[:items]
  end
end
