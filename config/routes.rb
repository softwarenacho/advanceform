Rails.application.routes.draw do
  root 'contacts#advance_form'
  post 'advance_form', to: 'contacts#update_zoho'
end
