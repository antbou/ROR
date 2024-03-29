# frozen_string_literal: true

Rails.application.routes.draw do
  resources :courses
  resources :promotions
  resources :courses do
    resources :exams
  end
  resources :exams do
    resources :evaluations
  end

  root to: 'home#index'
  devise_for :students, controllers: { registrations: 'students/registrations' }
  devise_for :teachers
end
