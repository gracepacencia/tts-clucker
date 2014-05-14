class UsersController < ApplicationController
  
  def new
  end

  def login
		emailin = params[:emailin]
		pwordin = params[:pwordin]
		p emailin + '|' + pwordin

		test = JSON.generate({'emailin' => emailin, 'pwordin' => pwordin});
		p test;

		@user = Users.where(:email => emailin).where(:pword => pwordin).first
		# p @user;
		

		if @user != nil
			respond_to do |format|
			  format.json{render :json => test}
				p 'Hello';

			#redirect_to :controller => 'clucks'

			 end
		else
			error = JSON.generate({'error' => 'record not found'})
			respond_to do |format|
			format.json{render :json => error}
			end
		 	
		end
	end


	def cluck
		user_id = params[:user]
		@clucks = Cluck.where(userid: user_id)



	end
end

        
 