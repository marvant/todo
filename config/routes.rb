Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
  	root :to => redirect("/tasks")
  end

  root :to => redirect("/users/sign_in")
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'welcome#index'

  resources :tasks
end
