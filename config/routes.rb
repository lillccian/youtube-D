Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "songs#index"
  resources :songs do
  	resources :ytlinks
  	resources :comments
    resources :tags
    resources :likes , :only=>[:create ,:destroy]
    resources :keeps , :only=>[:create ,:destroy]

    collection do
      get  :about
    end
  end
  resources :users

  namespace :admin do
    resources :users
  end

end
