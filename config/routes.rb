Rails.application.routes.draw do
  resources :students, only: [:new, :create]

  get 'schools/:school_id/classes/:class_id/students', to: 'school_classes#students'
  get 'schools/:school_id/classes', to: 'schools#classes'

end
