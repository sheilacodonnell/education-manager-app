Rails.application.routes.draw do
  root to: 'teacher#show'

  devise_for :teachers, :controllers => {
    registrations: 'registrations'
  }

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :teachers do
    resources :subjects do
      get :remove_student
      resources :assignments do
        resources :submissions
      end
    end
  end
  resources :students
end
