class RecipeService
  def self.conn
    Faraday.new(url: 'https://api.edamam.com', params: { app_id: ENV['edamam_id'], app_key: ENV['edamam_recipe_api'] })
  end

  def self.get_recipe_by_country(country)
    response = conn.get('/api/recipes/v2?type=public', { q: country })
    #   f.params['q'] = country
    # end
    JSON.parse(response.body, symbolize_names: true)[:hits].take(10)
  end
end
