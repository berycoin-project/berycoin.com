class SessionsController < Devise::SessionsController
  layout 'login', only: [:new]
end
