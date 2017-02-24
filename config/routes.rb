Rails.application.routes.draw do

  devise_for :users
  root 'contacts#index'
  resources :contacts do
    resources :notes
    resources :tasks
  end

  get '/all-tasks/' => 'tasks#allTasks', :as => :all_tasks
  get '/all-notes/' => 'notes#allNotes', :as => :all_notes

end
