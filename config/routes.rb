Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'

  resources :users, only: :show do
    get :favorites, on: :collection
  end

  resources :cookings do
    resource :recipes, only: [:new, :create, :edit, :update]
    resource :favorites, only: [:create, :destroy]

    collection do
      get 'chooseIndex'
      get 'chooseSearch'
      get 'incrementalSearch'
      get 'categorySearch'
      get 'cookingSearch'
    end

    member do
      get 'imageDestroy'
    end
  end

end
