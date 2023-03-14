Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users do
    # module を使うことで users/:user_id/notes/:id になる
    resources :notes ,module: :users
  end
  resources :words do
    resources :notes ,module: :words
  end
  resources :notes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
