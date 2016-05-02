Rails.application.routes.draw do
  #get 'calendars/show'

  root 'calendars#show', :as => "calendar"

  resources :jobs

  resources :projects

  resources :resources

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
end
