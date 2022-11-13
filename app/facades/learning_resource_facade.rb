class LearningResourceFacade
  def self.media_by_country(searched_country)
    country_result = CountryService.get_country(searched_country)[:name][:common]
    yt_video = YouTubeService.get_videos(@country = country_result)
    @pics = UnsplashService.get_images(@country = country_result)

    data = OpenStruct.new({
      id: nil,
      type: 'learning_resource',
      attributes: {
        country: @country,
        video: {
          title: yt_video[:snippet][:title],
          youtube_video_id: yt_video[:id][:videoId]
        },
        images: top_images
      }
      })
  end

  def self.top_images
    @pics.map do |pic|
      pic_hash = {
        alt_tag: pic[:alt_description],
        url: pic[:urls][:raw]
      }
    end
  end
end
