Railery::Application.routes.draw do
  
  devise_for :users
  resources :user , only: [:dashboard]
  resources :audios, only: [:create]
  root :to => 'home#index'
  match '/dashboard' => "user#dashboard", :as => :user_root
  namespace :api do
    namespace :v1  do
      resources :tokens,:only => [:create, :destroy]
    end
  end
end
