Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers
  resources :destinations
  resources :posts
  post '/addlike/:post_id', to: 'posts#like_post', as: 'addlike'
  patch "post/:id/like", to: 'posts#like', as: "like" 
end
