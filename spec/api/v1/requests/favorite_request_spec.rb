require 'rails_helper'

RSpec.describe 'Favorite Request' do
  let!(:user) { User.create!(name: 'Mike Dao', email: 'mikedao@bestgirlever.com', password: 'password', password_confirmation: 'password') }

  it 'posts favorites for a user based on api_key' do
    favorite_params = ({
      api_key: user.api_key,
      country: 'thailand',
      recipe_link: 'https://www.tastingtable.com/.....',
      recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)'
      })

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    created_favorite = Favorite.last

    expect(response_body).to eq({ :success=>'Favorite added successfully' })
  end

  it 'retrieves the user favorites' do
    favorite_params = ({
      api_key: user.api_key,
      country: 'Thailand',
      recipe_link: 'https://www.tastingtable.com/.....',
      recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)'
      })

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    favorites = response_body[:data]

    expect(favorites).to be_an Array
    favorites.each do |favorite|
      expect(favorite.keys).to eq([:id, :type, :attributes])
      expect(favorite[:id]).to be_a String
      expect(favorite[:type]).to be_a String
      expect(favorite[:type]).to eq('favorite')
      expect(favorite[:attributes].keys).to eq([:country, :recipe_link, :recipe_title, :created_at])
      expect(favorite[:attributes][:country]).to be_a String
      expect(favorite[:attributes][:country]).to eq('Thailand')
      expect(favorite[:attributes][:recipe_link]).to be_a String
      expect(favorite[:attributes][:recipe_link]).to eq('https://www.tastingtable.com/.....')
      expect(favorite[:attributes][:recipe_title]).to be_a String
      expect(favorite[:attributes][:recipe_title]).to eq('Crab Fried Rice (Khaao Pad Bpu)')
      expect(favorite[:attributes][:created_at]).to be_a String
      expect(favorite[:attributes]).to_not have_key(:updated_at)
    end
  end

  it 'cannot create favorite if api_key is missing or invalid' do
    favorite_params = ({
      country: 'thailand',
      recipe_link: 'https://www.tastingtable.com/.....',
      recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)'
      })

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(400)
    expect(response.body).to include('Missing parameter or invalid API key')
    expect(response_body).to eq({ :errors=>'Missing parameter or invalid API key' })
  end

  it 'cannot get favorites if api_key is missing or invalid' do
    favorite_params = ({
      country: 'thailand',
      recipe_link: 'https://www.tastingtable.com/.....',
      recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)'
      })

    headers = { 'CONTENT_TYPE' => 'application/json' }

    get '/api/v1/favorites?api_key='

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(400)
    expect(response.body).to include('Missing parameter')
    expect(response_body).to eq({ :errors=>'Missing parameter' })
  end
end
