Rails.application.routes.draw do

  #Api definition
  namespace :api do
    namespace :v1 do
      get 'index', to: 'event#index', as: 'event_index'
      get 'myEvent', to: 'event#my_events', as: 'my_events'
      patch 'myEvent/:id', to: 'event#update', as: 'my_events_update'
      post 'myEvent', to: 'event#create', as: 'my_events_create'
      delete 'myEvent/:id/remove', to: 'event#destroy', as: 'my_event_remove'
      get 'calender', to: 'event#calender'


      post 'signUp', to: 'sign_up#create', as: 'sign_up_submit'

      post 'authenticate', to: 'authentication#authenticate'

      post 'password_resets', to: 'password_resets#create', as: 'password_resets_create'
      patch 'password_resets/:token', to: 'password_resets#update', as: 'password_resets_update'

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'event#index'

  get '/', to: 'event#index', as: 'event_index'
  get 'myEvent', to: 'event#my_events', as: 'my_events'
  get 'myEvent/:id/edit', to: 'event#edit', as: 'my_events_edit'
  patch 'myEvent/:id', to: 'event#update', as: 'my_events_update'
  get 'myEvent/new', to: 'event#new', as: 'my_events_new'
  post 'myEvent', to: 'event#create', as: 'my_events_create'
  delete 'myEvent/:id/remove', to: 'event#destroy', as: 'my_event_remove'
  get 'calender', to: 'event#calender'

  get 'signIn', to: 'sign_in#new', as: 'sign_in'
  post 'signIn', to: 'sign_in#create', as: 'sign_in_submit'
  delete 'signOut', to: 'sign_in#destroy', as: 'sign_out'

  get 'signUp/new', to: 'sign_up#new', as: 'sign_up'
  post 'signUp', to: 'sign_up#create', as: 'sign_up_submit'

  get 'password_resets/new', to: 'password_resets#new', as: 'password_resets_new'
  post 'password_resets', to: 'password_resets#create', as: 'password_resets_create'
  get 'password_rests/:token/edit', to: 'password_resets#edit', as: 'password_resets_edit'
  patch 'password_rests/:token', to: 'password_resets#update', as: 'password_resets_update'



end
