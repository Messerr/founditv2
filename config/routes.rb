Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  get 'welcome/index'
  get 'welcome/new'
  get 'welcome/show'
  get 'welcome/edit'
end
