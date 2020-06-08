Rails.application.routes.draw do
  devise_for :users
  devise_for :headhunters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :job_opportunities do
    resources :job_perfils, only: [:new, :create, :index, :edit, :update]
    resources :offers, only: [:new, :create] do
      put '/accept', to: 'offers#accept'
      get '/reject', to: 'offers#review'
      put '/reject', to: 'offers#reject'
    end
  end
  resources :perfils, only: [:show, :edit, :update, :index] do
    resources :comments, only: [:new, :create]
    resources :favorites, only: [:create, :destroy]
  end
  scope '/headhunters' do
    get 'job_opportunities', to: 'job_opportunities#headhunter', as: :headhunter_job_opportunities
    get 'offer', to: 'offers#index', as: :headhunter_offer
  end

  #get '/headhunters/job_opportunities', to: 'job_opportunities#headhunter', as: :headhunter_job_opportunities
  #get '/headhunters/offer', to: 'offers#index', as: :headhunter_offer
  put '/job_opportunities/:id/close', to: 'job_opportunities#close', as: :close_job_opportunity
end
