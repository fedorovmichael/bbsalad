class AccountController < ApplicationController
  
  layout 'account'
  
  def index
  
   render 'index'
  
  end

  def create
  
   @user = User.find_by_login(params[:user][:login])
   
   if @user && @user.authenticate(params[:user][:password])      
      session[:admin] = @user.id   
      redirect_to url_for(:controller => :admin, :action => :index)      
   else
      render 'index'          
   end 
 
  end
  
  def destroy
      session[:admin] = nil
      redirect_to url_for(:controller => :home, :action => :index) 
  end
end
