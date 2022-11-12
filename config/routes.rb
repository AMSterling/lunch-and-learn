Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[index]
      resources :learning_resources, only: %i[index]
    end
  end
end
