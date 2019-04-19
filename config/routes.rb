Rails.application.routes.draw do
  resources :searches
  resources :lpublishers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "lpublishers/filter/:scope" => "lpublishers#index", as: :filtered_lpublishers
  post '/miaprova1', to: 'searches#createprova1'   #ugo.2019.04.05
end
