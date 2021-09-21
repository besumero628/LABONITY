Rails.application.routes.draw do

  # devise関連
  devise_for :users, path: "", controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :company_admins, path: "c_admin", controllers: {
    sessions: 'company_admin/sessions',
    passwords: 'company_admin/passwords',
    registrations: 'company_admin/registrations'
  }

  devise_for :admins, path: "admin", controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # main
  namespace :company_admin, path: "c_admin" do
    root "top#index"
  end

  namespace :admin do
    root "top#index"
  end

  namespace :public, path: "" do
    root "top#index"

    resources :news, only: [:index, :show]
    resources :communities


    resources :laboratories do
      get 'member'
      resources :press_releases, except:[:index]
      resources :papers
      resources :confernces
    end

    get 'rsses/ajax1'
    get 'rsses/ajax2'
    get 'rsses/ajax3'
    get 'rsses/ajax4'
    get 'rsses/ajax5'

    get ':login_id/mypage' => 'users#mypage', param: :login_id, as: :mypage #すべてに反応してしまうので一番最後
    resources :users, param: :login_id, path: "", only: [:show, :update] do
      resources :rsses, only: [:index]
      resources :rss_choices, only: [:create, :destroy]
    end
  end

end
