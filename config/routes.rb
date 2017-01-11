Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolio#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  

  resources :blogs

  root to: 'pages#home'
end
