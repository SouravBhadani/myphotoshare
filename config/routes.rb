Rails.application.routes.draw do
  root 'pins#index'
  get 'home/about'
  mount Ckeditor::Engine => '/ckeditor'
  resources :pins
  resources :messages
  resources :prettylinks
  resources :blogs
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  post 'like_pin' => 'socials#like', :as => 'pin_like'
  
  get 'play' => 'games#play'
  get 'game' => 'games#index'
  get 'statitistics' => 'games#statitistics'
  get 'result' => 'games#result'
  get 'hit' => 'games#hit_or_stand'
  get 'stand' => 'games#hit_or_stand'
end