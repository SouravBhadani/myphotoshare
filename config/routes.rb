Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :messages

  resources :prettylinks

  resources :blogs

  root 'pins#index'
  post 'like_pin' => 'socials#like', :as => 'pin_like'
  resources :pins
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  get 'home/about'
end