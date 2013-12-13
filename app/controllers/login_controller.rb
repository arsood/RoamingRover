require 'bcrypt'

class LoginController < ApplicationController

	def read
		render 'login'
	end

	def write
		#Get user by email

		auth_user = User.find_by_email(params[:login_email])

		#Generate password based on given parameters

		if auth_user == nil ||  BCrypt::Password.new(auth_user.password) != params[:login_password]
			render 'login'
		else
			#Set up our session variables

			session[:email_address] = auth_user.email
			session[:user_type] = auth_user.user_type
			session[:user_id] = auth_user.id
			session[:first_name] = auth_user.first_name
			session[:last_name] = auth_user.last_name
			session[:phone_number] = auth_user.phone
			session[:zip_code] = auth_user.zipcode
			session[:login] = true
			if session[:user_type] == 'walker'
				redirect_to '/dashboard/' + session[:zip_code].to_s
			elsif session[:user_type] == 'client'
				redirect_to '/dashboard/'
			end
				
		end
	end

	def logout
		session[:login] = nil
		@logout = true
		render 'login'
	end
end
