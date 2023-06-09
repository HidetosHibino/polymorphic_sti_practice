Rails.application.routes.draw do
  get 'usefuls/index'
  namespace :words do
    get 'similar/new'
    get 'similar/create'
  end
  root 'static_pages#top'
  resources :users do
    # module を使うことで users/:user_id/notes/:id になる
    resources :notes ,module: :users
    resources :rates, module: :users
  end
  resources :words do
    resources :notes ,module: :words
    resources :meanings, module: :words, controller: :reactions, type: 'Meaning'
    resources :samples, module: :words, controller: :reactions, type: 'Sample'
    resources :sounds, module: :words, controller: :reactions, type: 'Sound'
    resources :similars, module: :words
    resources :rates, module: :words
  end

  resources :questions do
    resources :notes ,module: :questions
  end

  resources :notes

  resources :reactions
  resources :meanings, controller: :reactions
  resources :samples, controller: :reactions do
    resources :usefuls
  end
  resources :sounds, controller: :reactions
  resources :similars, controller: :reactions
  resources :usefuls
  resources :rates
  resources :good_rates, controller: :rates
  resources :bad_rates, controller: :rates

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
