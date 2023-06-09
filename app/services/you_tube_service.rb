class YouTubeService
  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com', params: { key: ENV['YouTube_API'] })
  end

  def self.get_videos(country)
    response = conn.get('/youtube/v3/search?') do |f|
      f.params['part'] = 'snippet'
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['maxResults'] = '1'
      f.params['q'] = country
    end
    JSON.parse(response.body, symbolize_names: true)[:items][0]
  end
end
