Rails.application.routes.draw do
  root 'contacts#advance_form'
  post 'advance_form', to: 'contacts#update_zoho'
  get 'static', to: 'contacts#static'
end
