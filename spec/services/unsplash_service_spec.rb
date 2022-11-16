require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  it 'retrieves images related to the searched country' do
    country = 'laos'
    pics = UnsplashService.get_images(country)

    expect(pics).to be_an Array
    expect(pics.count).to eq 10
    pics.each do |pic|
      expect(pic.keys).to eq([
        :id,
        :created_at,
        :updated_at,
        :promoted_at,
        :width,
        :height,
        :color,
        :blur_hash,
        :description,
        :alt_description,
        :urls,
        :links,
        :likes,
        :liked_by_user,
        :current_user_collections,
        :sponsorship,
        :topic_submissions,
        :user,
        :tags
        ])
      expect(pic[:alt_description]).to be_a String
      expect(pic[:urls]).to be_a Hash
      expect(pic[:urls].keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
      expect(pic[:urls][:raw]).to be_a String
    end
  end
end
