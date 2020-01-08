Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tasks#index'


  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
  	get 'signup', to: 'devise/registrations#new'
  end
  get   'accounts/index' 
  get   'accounts/new'
  post  'accounts/create'
  patch 'accounts/update'
  get   'accounts/show'
  get   'accounts/edit'
  get   'accounts/delete'
  get   'accounts/update'
  get   'accounts/show_users'

  get   'tasks/index' 
  get   'tasks/new'
  post  'tasks/create'
  patch 'tasks/update'
  get   'tasks/show'
  get   'tasks/edit'
  delete   'tasks/delete'
  get   'tasks/update'

  get   'contacts/index' 
  get   'contacts/new'
  post  'contacts/create'
  patch 'contacts/update'
  get   'contacts/show'
  post   'contacts/edit'
  delete   'contacts/delete'
  get   'contacts/update'
  get 'contacts/index_by_account'

  get   'projects/index' 
  get   'projects/leads'
  get   'projects/opportunities'
  get   'projects/new'
  post  'projects/create'
  patch 'projects/update'
  get   'projects/show'
  get   'projects/edit'
  delete   'projects/delete'
  get   'projects/update'

end
