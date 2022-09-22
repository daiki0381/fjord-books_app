Rails.application.routes.draw do
  root 'homes#index'
  get 'homes/show'
  devise_for :users
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
