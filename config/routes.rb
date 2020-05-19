Rails.application.routes.draw do
  devise_for :users
  devise_for :headhunters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :job_opportunities
end
