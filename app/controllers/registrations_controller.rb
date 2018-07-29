class RegistrationsController < Devise::RegistrationsController
  layout 'register', only: [:new]
end
