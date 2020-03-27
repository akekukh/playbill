Rails.application.routes.draw do
  resources :performances, only: [:create, :index, :delete, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
