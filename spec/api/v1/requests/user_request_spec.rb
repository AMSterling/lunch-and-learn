require 'rails_helper'

RSpec.describe 'User Requests' do
  it 'registers a new user' do
    user_params = ({
      name: 'Mike Dao',
      email: 'mikedao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password'
      })
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/users', headers: headers, params: user_params, as: :json

    expect(response).to be_successful

    body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    expect(response).to have_http_status(201)
    expect(body[:data]).to have_key(:id)
    expect(body[:data][:id].to_i).to eq(created_user.id)
    expect(body[:data]).to have_key(:type)
    expect(body[:data][:type]).to eq('user')
    expect(body[:data]).to have_key(:attributes)
    expect(body[:data][:attributes]).to have_key(:name)
    expect(body[:data][:attributes][:name]).to eq(created_user.name)
    expect(body[:data][:attributes]).to have_key(:email)
    expect(body[:data][:attributes][:email]).to eq(created_user.email)
    expect(body[:data][:attributes]).to_not have_key(:password)
    expect(body[:data][:attributes]).to_not have_key(:password_confirmation)
    expect(created_user.name).to eq(user_params[:name])
    expect(created_user.email).to eq(user_params[:email])
    expect(body[:data][:attributes]).to have_key(:api_key)
    expect(body[:data][:attributes][:api_key]).to be_a String
    expect(created_user.password_digest).to be_a String
    expect(created_user.api_key).to be_a String
  end

  it 'cannot create account if passwords mismatched' do
    user_params = ({
      name: 'Mike Dao',
      email: 'mikedao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password123'
      })

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: user_params, as: :json

    expect(response).to have_http_status(422)
  end

  it 'cannot create account if email is already taken' do
    user_params = ({
      name: 'Mike Dao',
      email: 'mikedao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password'
      })

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: user_params, as: :json

    body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    new_user_params = ({
      name: 'Mike Dao',
      email: 'mikedao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password'
      })

    post '/api/v1/users', headers: headers, params: JSON.generate(new_user_params)

    expect(response).to have_http_status(422)
    expect(response.body).to include('Email has already been taken')
  end
end
