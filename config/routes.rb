Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  as :user do
    # get "/users/sign_up" => "devise/registrations#new", as: :new_user_registration
    post "/users/sign_in" => "devise/sessions#create", as: :user_session
    delete "/users/sign_out" => "devise/sessions#destroy", as: :destroy_user_session
    post "/users" => "devise/registrations#create", as: :user_registration
    get "/users/cancel" => "devise/registrations#cancel", as: :cancel_user_registration
    get "/users/edit" => "devise/registrations#edit", as: :edit_user_registration
    get "/users/bg" => "users#edit", as: :edit_user_bg
    patch "/users" => "devise/registrations#update"
    put "/users" => "devise/registrations#update"
    delete "/users" => "devise/registrations#destroy"
  end


  root 'static_pages#home'
  match '/step1',    to: 'static_pages#step1',    via: 'get'
  match '/step2',    to: 'static_pages#step2',    via: 'get'
  match '/step3',    to: 'static_pages#step3',    via: 'get'
  match '/', to: 'static_pages#home', anchor: 'login', as: :new_user_session, via: 'get'

  resources :users, only: [:update, :edit]
  resources :problems, only: [] do
    member do
      post 'vote'
      delete 'unvote'
    end
  end

  namespace :admin do
    get '/', to: redirect('/admin/problems')
    resources :problems
    resources :users, only: [:index, :update]
  end

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
