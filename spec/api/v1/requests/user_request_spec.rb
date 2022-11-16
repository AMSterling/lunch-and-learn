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

    response_body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    expect(response).to have_http_status(201)
    expect(response_body[:data]).to have_key(:id)
    expect(response_body[:data][:id].to_i).to eq(created_user.id)
    expect(response_body[:data]).to have_key(:type)
    expect(response_body[:data][:type]).to eq('user')
    expect(response_body[:data]).to have_key(:attributes)
    expect(response_body[:data][:attributes].keys).to eq([:name, :email, :api_key])
    expect(response_body[:data][:attributes].values).to be_all String
    expect(response_body[:data][:attributes]).to_not have_key(:id)
    expect(response_body[:data][:attributes]).to_not have_key(:password)
    expect(response_body[:data][:attributes]).to_not have_key(:password_confirmation)
    expect(response_body[:data][:attributes][:name]).to eq(created_user.name)
    expect(response_body[:data][:attributes][:email]).to eq(created_user.email)
    expect(response_body[:data][:attributes][:api_key]).to eq(created_user.api_key)
    expect(created_user.name).to eq(user_params[:name])
    expect(created_user.email).to eq(user_params[:email])
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

    response_body = JSON.parse(response.body, symbolize_names: true)
    created_user = User.last

    new_user_params = ({
      name: 'Mike Dao',
      email: 'mikedao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password'
      })

    post '/api/v1/users', headers: headers, params: JSON.generate(new_user_params)

    expect(response).to have_http_status(422)
    expect(response.body).to eq('Email has already been taken')
  end
end
