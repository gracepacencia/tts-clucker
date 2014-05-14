require 'json'

class ApiController < ApplicationController
	def catch
		fname = params[:fname]	
		lname = params[:lname]
		email = params[:email]
		pword = params[:pword]
		p fname + '|' + lname + '|' + email + '|' + pword

		test = JSON.generate({'fname'=>fname, 'lname' => lname, 'email' => email, 'pword' => pword});
		p test;
		
		@user = Users.new()
		# p '111'
		@user.lname=lname
		@user.fname=fname
		@user.email=email
		@user.pword=pword
		# p '222'
		if @user.save
		
			respond_to do |format|
			 format.json{render :json => test}
			end
		else
			error = JSON.generate({'error'=>'error saving data'})
			respond_to do |format|
			 format.json{render :json => error}
			end
		end
	 
	 end

	 
end


	

    