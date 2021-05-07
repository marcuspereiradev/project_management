Rails.application.routes.draw do
  resources :activities
  resources :projects do
    resources :activities
  end

  get "finished/:id", to: "activities#finished?", as: :finished

  root 'projects#index'
end
