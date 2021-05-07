Rails.application.routes.draw do
  resources :projects do
    resources :activities
  end
  get "finished/:project_id/:id", to: "activities#finished", as: :finished
  root 'projects#index'
end
