Rails.application.routes.draw do
  devise_for :users
  devise_for :headhunters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :job_opportunities do
    resources :job_perfils, only: [:new,:create]
  end
  resources :perfils, only: [:show, :edit, :update, :index] do
    resources :comments, only: [:new, :create]
    resources :favorites, only: [:create, :destroy]
  end

  get '/headhunters/job_opportunities', to: 'job_opportunities#headhunter', as: :headhunter_job_opportunities
end
