Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'events#index'
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'

  get 'browse', to: 'events#browse', as: :browse_events

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
  patch ':username/edit', to: 'profiles#update', as: :update_profile
  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  post 'events/:event_id/attend', to: 'participations#attend_event', as: :attend_event
  post 'events/:event_id/unattend', to: 'participations#unattend_event', as: :unattend_event
  get 'events/:event_id/attendees', to: 'participations#index', as: :attendees_event
  get 'events/:event_id/new_registration', to: 'participations#new', as: :new_registration
  post 'events/:event_id/create_registration', to: 'participations#create', as: :create_registration

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :events do
    # resources :participations
    resources :comments
      member do
        get 'like'
        get 'unlike'
    end
  end

  resources :users

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
