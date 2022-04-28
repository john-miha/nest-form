Rails.application.routes.draw do
  root to: 'parents#new'
  post 'input' => 'parents#create'
  resources :parents
  resources :childs
end
