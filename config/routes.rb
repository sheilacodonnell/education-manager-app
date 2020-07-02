Rails.application.routes.draw do
  devise_for :teachers, :controllers => {
    registrations: 'registrations'
  }

  resources :teachers
  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
