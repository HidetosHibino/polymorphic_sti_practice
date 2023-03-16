Rails.application.routes.draw do
  namespace :words do
    get 'similar/new'
    get 'similar/create'
  end
  root 'static_pages#top'
  resources :users do
    # module を使うことで users/:user_id/notes/:id になる
    resources :notes ,module: :users
  end
  resources :words do
    resources :notes ,module: :words
    resources :meanings, module: :words, controller: :reactions, type: 'Meaning'
    resources :samples, module: :words, controller: :reactions, type: 'Sample'
    resources :sounds, module: :words, controller: :reactions, type: 'Sound'
    resources :similars, module: :words
  end

  resources :questions do
    resources :notes ,module: :questions
  end

  resources :notes

  resources :reactions
  resources :meanings, controller: :reactions
  resources :samples, controller: :reactions
  resources :sounds, controller: :reactions
  resources :similars, controller: :reactions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
