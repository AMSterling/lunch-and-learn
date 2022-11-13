require 'rails_helper'

RSpec.describe 'Learning Resource' do
  it 'retrieves videos on the selected country' do
    country = 'laos'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    # response_body = JSON.parse(response.body, symbolize_names: true)
    # resources = response_body[:data]

  end
end
