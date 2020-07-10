Rails.application.routes.draw do

  devise_scope :teacher do
    root to: "devise/sessions#new"
  end

  devise_for :teachers, :controllers => {
    registrations: 'registrations'
  }

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :teachers do
    resources :students
    resources :subjects do
      get :remove_student
      resources :assignments do
        resources :submissions
      end
    end
  end
end
