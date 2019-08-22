Rails.application.routes.draw do
  get 'users/:id/finalize', to: 'users#finalize', as: :finalize_user
  resources :users do
  end

  resources :observers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
