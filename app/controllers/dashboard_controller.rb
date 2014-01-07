class DashboardController < ApplicationController
	def select
		if session[:login] == nil
			redirect_to '/login'
		else
			if session[:user_type] == "client"
				render 'cl_dashboard'
			else
				pull_dw_info()
				#Dog walker's zipcode
				render 'dw_dashboard'
			end
		end
	end

	def save_request
		new_request = Activity.new

		new_request.client_id = User.where(email: session[:email_address]).first.id
		new_request.title = params[:request_title]
		new_request.description = params[:request_description]
		new_request.date = params[:request_date]
		new_request.time = params[:request_time1] + params[:request_time2]
		new_request.rate = params[:request_payment]
		new_request.zipcode = session[:zip_code]
		new_request.status = "pending"

		#Save it
		new_request.save

		render 'cl_dashboard'
	end

	#Get dog walker custom data

	def pull_dw_info
		@dw_zip = User.where(email: session[:email_address]).first.zipcode

		#Get min and max zipcodes allowed based on walker's zip code

		min_zip = ((params[:zip].to_i / 100).floor)*100
		max_zip = min_zip + 99

		@dog_listings = Activity.where(zipcode: min_zip..max_zip).order(created_at: :desc)

		#Set up empty variable for proper display of null class

		if @dog_listings.empty?
			@empty_dw = true
		else
			@empty_dw = false
		end
	end

	def send_proposal
		#Save the proposal on AJAX request

		new_prop = WalkerBids.new

		new_prop.walker_id = session[:user_id]
		new_prop.bid_id = params[:proposalId]

		#Assign the bid_id to the activity
		
		#activity_id_listed = Activity.where(params[:proposalId]).first.id
		#activity_id_listed = new_prop
		#activity_id_listed.save

		#Assign activities_id to bid

		#new_prop.set_activities_id(activity_id_listed.id)

		#Save it up

		new_prop.save

		#Get client ID

		client_id_listed = Activity.where(id: params[:proposalId]).first.get_client_id

		#Set up walker information provided in email

		given_name = session[:first_name] + " " + session[:last_name]

		if params[:sharePhone] == "yes"
			walker_phone = session[:phone_number]
		else
			walker_phone = "No number provided"
		end

		walker_email = session[:email_address]

		#Send out email

		UserMailer.proposal_email(User.where(id: client_id_listed).first, params[:propRate], params[:proposalDesc], given_name, walker_phone, walker_email).deliver

		#Send back AJAX response

		render :text => "ok"
	end
end
