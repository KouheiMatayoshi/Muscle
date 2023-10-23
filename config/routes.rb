Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trainings  do
    resources :likes, only: [:create, :destroy]
  end
  # get    'muscles'          => 'muscles#index'
  # musclesという文字をURLで入力するとmusclesコントローラーindexというアクションに行く
  get 'users' =>'users#index' 
  root 'trainings#index'
end
