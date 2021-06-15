Rails.application.routes.draw do
  resources :profiles, only: %i[new create edit update destroy]
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :blog_apps
  get '/recent', to: 'blog_apps#recent'
  get '/my_blogs', to: 'blog_apps#my_blogs'
  get '/blog_apps', to: 'blog_apps#index'
  get  '/share', to: 'blog_apps#share_blog'
  root 'blog_apps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
