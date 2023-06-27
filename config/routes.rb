Rails.application.routes.draw do
  resources :organizers do
    resources :integrations, only: %i(destroy) do
      collection do
        post :merge_link
      end
    end
    resources :users
  end

  root 'organizers#index'
end
