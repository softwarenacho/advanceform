Rails.application.routes.draw do
  root 'contacts#advance_form'
  get 'static', to: 'contacts#test'
  post 'advance_form', to: 'contacts#update_zoho'
end
