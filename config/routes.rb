Rails.application.routes.draw do
  resources :activities
  resources :projects

  get "finished/:id", to: "activities#finished?", as: :finished

  root 'projects#index'
end
