Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'
  resources :cookings do
    collection do
      get 'chooseIndex'
      get 'chooseSearch'
    end
    member do
      get 'imageDestroy'
    end
  end
end
