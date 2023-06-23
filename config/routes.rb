Rails.application.routes.draw do
  resources :organizers do
    member do
      post :create_merge_link
    end
  end
  resources :users

  root 'organizers#index'
end
