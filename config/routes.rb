Isengard::Application.routes.draw do
  devise_for :partners
  devise_for :users

  root 'welcome#index'

  resources :events do
    member do
      get 'export_status'
      post 'generate_export'
      post 'toggle_registration_open'
    end

    resources :access_levels do
      member do
        get 'toggle_visibility'
      end
    end
    resources :role_names

    member do
      get 'statistics'
      get 'scan'
      get 'list_registrations'
      post 'scan_barcode'
      post 'scan_name'
    end

    resources :tickets do
      member do
        get 'resend'
        get 'info'
      end

      collection do
        post 'email'
      end
    end

    resources :orders do
      member do
        get 'resend'
        get 'info'
      end

      resources :build, controller: 'orders/build'

      collection do
        post 'upload'
        post 'email'
      end
    end

    resources :partners do
      member do
        get 'sign_in', to: 'sign_in#sign_in_partner'
        get :resend
        post :confirm
      end
      collection do
        post 'upload'
      end
    end

    resources :promos do
      collection do
        post 'generate'
      end
    end
  end
end
