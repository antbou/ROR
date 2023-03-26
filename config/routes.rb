Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # authenticated :student do
  #   resources :subjects, module: "student", :only => [:show, :index]
  # end

  # authenticated :teacher do
  #     resources :subjects, module: "teacher"
  # end

  root to: "home#index"
  devise_for :students, controllers: { registrations: "students/registrations" }
  devise_for :teachers
end
