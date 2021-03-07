Rails.application.routes.draw do
  resources :apps do
    resources :datasets do
      resources :data_points
      resources :data_entries
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
