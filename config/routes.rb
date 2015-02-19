Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index'
  get '/terms' => 'terms#index'
  get '/faq' => 'common_questions#index'
  get '/tasks' => 'tasks#index'
  get '/about' => 'about#index'
  get '/users' => 'users#index'
  get '/projects' => 'projects#index'
  resources :tasks
  resources :users
  resources :projects

end
