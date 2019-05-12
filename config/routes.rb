Rails.application.routes.draw do
  resources :searches
  get 'searches/:id/esegui', to: 'searches#eseguiRicerca', as: 'eseric'    # 19/04/2019
  resources :lpublishers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "lpublishers/filter/:scope" => "lpublishers#index", as: :filtered_lpublishers
  post '/miaprova1', to: 'searches#createprova1'   #ugo.2019.04.05

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
