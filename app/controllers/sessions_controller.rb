class SessionsController < ApplicationController

  def create
    member = Member.find_by_username(params[:username])
    #find member and check if password is correct
    if member && member.authenticate(params[:password])
      #save the session as member id to remember
      session[:member_id] = member.id
      redirect_to '/'
    else
    #redirected to login
      redirect_to '/login'
    end
  end



  def destroy
    session[:member_id] = nil
    redirect_to '/login'
  end
end
