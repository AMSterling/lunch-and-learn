require 'rails_helper'

RSpec.describe YouTubeService, :vcr do
  it 'retrieves videos about the country' do
    country = 'laos'
    videos = YouTubeService.get_videos(country)

    expect(videos).to be_an Array
    expect(videos.count).to eq 10
    videos.each do |video|
      expect(video.keys).to eq([:kind, :etag, :id, :snippet])
      expect(video[:kind]).to eq('youtube#searchResult')
      expect(video[:etag]).to be_a String
      expect(video[:id]).to be_a Hash
      expect(video[:id].keys).to eq([:kind, :videoId])
      expect(video[:id][:kind]).to eq('youtube#video')
      expect(video[:id][:videoId]).to be_a String
      expect(video[:snippet].keys).to eq([
        :publishedAt,
        :channelId,
        :title,
        :description,
        :thumbnails,
        :channelTitle,
        :liveBroadcastContent,
        :publishTime
        ])
      expect(video[:snippet][:title]).to be_a String
      expect(video[:snippet][:title].downcase).to include(country.downcase)
    end
  end
end
