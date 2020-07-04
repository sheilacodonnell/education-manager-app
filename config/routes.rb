Rails.application.routes.draw do
  devise_for :teachers, :controllers => {
    registrations: 'registrations'
  }

  resources :teachers do
    resources :subjects do
      get :remove_student
    end
  end
end
