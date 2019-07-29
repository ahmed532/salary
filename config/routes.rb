Rails.application.routes.draw do
  get 'payment/summary'
  get 'payment/error'
  get 'payment/month_details/:month_num', to: 'payment#month_details'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  resources :departments
  resources :staff
end

