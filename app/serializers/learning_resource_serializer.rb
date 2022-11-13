class LearningResourceSerializer
  include JSONAPI::Serializer

  def self.new(media)
    {
      data: {
        id: media.id,
        type: media.type,
        attributes: media.attributes
      }
    }
  end
end
