Rails.application.routes.draw do
  root "home#index"

  get '/auth/:provider/callback',   to: 'sessions#create'
  delete 'sessions',                to: 'sessions#destroy',                    as: :destroy_session
  post '/search',                   to: 'search#index',                        as: :twitter_search
  get '/twitter/results',           to: 'search#index',                        as: :twitter_results
  post '/subscribe',                to: 'subscriptions#create',                as: :subscribe
  delete 'subscription',            to: 'subscriptions#destroy',               as: :destroy_subscription
  get '/subscriptions/feed',        to: 'subscriptions#feed',                  as: :feed
  get '/subscriptions/show',        to: 'subscriptions#index',                 as: :show_subscriptions

  get '/vimeo/results',              to: 'search#index',                       as: :vimeo_results

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
