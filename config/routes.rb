RoamingRover::Application.routes.draw do

  resources :activities
  resources :charges

  #Render homepage
  root 'greeting#index'


  #Render first signup process
  get 'signup/' => 'signup#signup_type'

  #Send over to second part of the signup process
  get 'signup/2' => 'signup#signup'
  post 'signup/2' => 'signup#signup2'

  #Finish signup
  get 'signup/3' => 'signup#select'
  post 'signup/3' => 'signup#signup3'

  #Select the right dashboard based on user type
  get 'dashboard/:zip' => 'dashboard#select'
  get 'dashboard/' => 'dashboard#select'
  post 'dashboard/' => 'dashboard#save_request'
  post 'dashboard/proposal/' => 'dashboard#send_proposal'

  #Post for setting session for user type on signup
  post 'signup/set/user_type/' => 'signup#set_user_type'

  #Reset session on command
  get 'reset/' => 'reset#reset_session'

  #Process login
  get 'login/' => 'login#read'
  post 'login/' => 'login#write'

  #Process logout
  get 'logout/' => 'login#logout'

  #Get google map
  get 'getmap/' => 'gmaps#get_adds'
end
