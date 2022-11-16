require 'rails_helper'

RSpec.describe 'Learning Resource Request', :vcr do
  it 'retrieves videos on the selected country' do
    country = 'laos'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    response_body = JSON.parse(response.body, symbolize_names: true)
    resources = response_body[:data]

    expect(resources.keys).to eq([:id, :type, :attributes])
    expect(resources[:id]).to be_nil
    expect(resources[:type]).to eq('learning_resource')
    expect(resources[:attributes].keys).to eq([:country, :video, :images])
    expect(resources[:attributes]).to_not have_key(:id)
    expect(resources[:attributes][:country]).to eq('Laos')
    expect(resources[:attributes][:video].keys).to eq([:title, :youtube_video_id])
    expect(resources[:attributes][:video][:title]).to eq('A Super Quick History of Laos')
    expect(resources[:attributes][:video][:youtube_video_id]).to eq('uw8hjVqxMXw')
    expect(resources[:attributes][:images]).to be_an Array
    expect(resources[:attributes][:images].count).to eq 10
    resources[:attributes][:images].each do |image|
      expect(image.keys).to eq([:alt_tag, :url])
      expect(image).to_not have_key(:id)
      expect(image[:alt_tag]).to be_a String
      expect(image[:url]).to be_a String
      expect(image[:url]).to include('https://images.unsplash.com/photo-')
    end
  end
end
