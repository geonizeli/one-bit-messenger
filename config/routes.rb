# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chats#index'

  devise_for :users

  resources :contacts, only: %i[index new create destroy]
  resources :chats, only: %i[index show] do
    resources :messages, only: :create, defaults: { format: :js }
  end
end
