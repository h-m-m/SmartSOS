class SessionsController < ApplicationController

	def organizations_new
		if session[:organization_id]
			redirect_to organization_path(Organization.find(session[:organization_id]))
		end
	end

	def organizations_create
		if organization = Organization.find_by_email(params[:email])
			if organization.authenticate(params[:password])
				session[:organization_id] = organization.id
				redirect_to show_dashboard_path(organization)
			else
				flash.now.alert = 'Invalid Password'
				render 'organizations_new'
			end
		else
			flash.now.alert = 'Invalid Organization Email'
			render 'organizations_new'
		end
	end

	def donors_new
		if session[:donor_id]
			redirect_to donor_path(Donor.find(session[:donor_id]))
		end
	end

	def donors_create	
		if donor = Donor.find_by_email(params[:email])
			if donor.authenticate(params[:password])
				session[:donor_id] = donor.id
				redirect_to donor_path(donor)
			else
				flash.now.alert = 'Invalid Password'
				render 'donors_new'
			end
		else
			flash.now.alert = 'Invalid Email'
			render 'donors_new'
		end
	end

	def logout
		reset_session
		redirect_to root_path
	end

end
