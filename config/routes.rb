Rails.application.routes.draw do
  
  devise_for :users, path: ""
  

  namespace :public, path: "" do
    root "top#index"
    
    
    get 'top/ajax'
    
    resources :news, only: [:index, :show]
  end
  
  namespace :company_admin, path: "c_admin" do
    root "top#index"
  end
  
  namespace :admin do
    root "top#index"
  end
  
end
