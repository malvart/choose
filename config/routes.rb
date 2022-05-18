Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'
  resources :users, only: :show
  resources :cookings do
    resource :recipes, only: [:new, :create, :edit]
    collection do
      get 'chooseIndex'
      get 'chooseSearch'
      get 'incrementalSearch'
      get 'categorySearch'
    end
    member do
      get 'imageDestroy'
    end
  end
end
