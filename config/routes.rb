Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'
  resources :cookings do
    collection do
      get 'chooseIndex'
      get 'chooseSearch'
      get 'incrementalSearch'
      get 'search'
    end
    member do
      get 'imageDestroy'
    end
  end
  resources :users, only: :show
end
