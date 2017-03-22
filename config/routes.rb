Rails.application.routes.draw do

  root 'contacts#index'
  devise_for :users

  resources :contacts do
    resources :notes
    resources :tasks
  end

  get "search/index"

  get '/all-tasks/' => 'tasks#allTasks', :as => :all_tasks
  get '/all-notes/' => 'notes#allNotes', :as => :all_notes

  # constraints(Constraints::TenantSubdomain) do
  #   # nothing yet
  # end

end
