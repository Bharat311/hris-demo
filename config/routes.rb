Rails.application.routes.draw do
  resources :organizers do
    member do
      get :merge
      get :paragon
    end

    resources :integrations, only: %i(destroy) do
      collection do
        post :merge_link
      end
    end
    resources :users
  end

  resources :data, only: %i() do
    collection do
      post :ingest
      post :sync
      post :clear
    end
  end

  root 'organizers#index'
end
