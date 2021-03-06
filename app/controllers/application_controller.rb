class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def unlock_params(object)  	
      params.require(object).permit!	
  end
  
  def validate_admin  
      if session[:admin].nil?
         redirect_to account_index_path
      elsif
         user = User.find(session[:admin])         
         if user.nil?
            redirect_to account_index_path
         end                  
      end               
  end
  
end
