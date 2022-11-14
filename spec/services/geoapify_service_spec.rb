require 'rails_helper'

RSpec.describe GeoapifyService, :vcr do
  it 'returns tourism sites from country' do
    sights = GeoapifyService.get_sights('lnglat')


  end
end
