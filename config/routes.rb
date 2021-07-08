Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :sign_up }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, shallow: true, only: :index
    resources :badges, shallow: true
  end

  get 'admin/tests', to: "admin/tests#index", as: :admin_root
  get 'tests', to: "tests#index", as: :user_root

  resources :feedbacks, only: %i[new create]
  resources :badges, only: %i[index show]
  resources :achievements, only: :index
end
