Rails.application.routes.draw do

  resources :contacts do
    resources :notes
    resources :tasks
    get :update_variable
  end

  resources :companies

  devise_for :users
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
  get 'users/:id/preferences' => 'users#preferences', :as => :preferences

end
