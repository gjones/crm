require 'constraints/subdomain_constraints'

Rails.application.routes.draw do

  constraints(Constraints::SubdomainConstraint) do
    devise_for :users

    resources :contacts do
      resources :notes
      resources :tasks
    end

    resources :users
    devise_scope :user do
      authenticated :user do
        root 'contacts#index', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end

    get "search/index"

    get '/all-tasks/' => 'tasks#allTasks', :as => :all_tasks
    get '/all-notes/' => 'notes#allNotes', :as => :all_notes
  end

  resources :tenants

end
