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
  
  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # 以下main
  namespace :company_admin, path: "company" do

  end

  namespace :admin do
    root "top#index"
  end

  namespace :public, path: "" do
    root "top#index"
    
    get 'top', to: 'top#faq'
    resources :news, only: [:index, :show]
    resources :communities do
      resources :community_members, only: [:create, :destroy]
      resources :community_messages, only: [:create]
    end



    resources :laboratories do
      get 'member'
      patch 'permit'
      resources :press_releases, except:[:index]
      resources :papers
      resources :confernces
      resources :projects, except:[:show]
      resources :albums
      resources :lablinks, except:[:show]
      resources :labmembers, only:[:create]
      resources :accesses, except:[:show, :destroy]
      resources :labimages, only:[:create, :destroy]
      resources :schedules, only:[:index, :create, :destroy]
    end

    resources :companies do
      resources :events, except:[:index]
      resources :companyimages, only:[:create, :destroy]
    end
    
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'

    get 'rsses/ajax1'
    get 'rsses/ajax2'
    get 'rsses/ajax3'
    get 'rsses/ajax4'
    get 'rsses/ajax5'
    
    resources :relationships, only: [:create, :destroy]
    resources :searches, only: [:index]
    
    get ':login_id/mypage' => 'users#mypage', param: :login_id, as: :mypage #すべてに反応してしまうので一番最後
    resources :users, param: :login_id, path: "", only: [:show, :update] do
      resources :rsses, only: [:index]
      resources :rss_choices, only: [:create, :destroy]
      resources :user_papers
      resources :user_confernces
      resources :user_books
      resources :relationships, only: [:index]
    end
  end

end
