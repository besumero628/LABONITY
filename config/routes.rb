Rails.application.routes.draw do
  
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
