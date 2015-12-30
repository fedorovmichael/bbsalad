class AdminController < ApplicationController

#   before_filter :check_if_admin
   layout "admin"

  def index
  
   @user = User.new
  
   render 'index'
  end
  
  def create
  
   render 'create'
  
  end
  
  def edit
   render 'edit'
  end

  def create_product
      
      @product = Product.create(unlock_params(:product))
      
      if @product.errors.empty?      
         flash.now[:success] = "New item saved successfully"     
         render 'create'         
      else
         flash.now[:error] = "Failed to save item"
		   render "create"
		end 	  
   
  end

  def create_user
  
      unlock_params(:user)
  
  end
  
  private
  
  def unlock_params(object)
  	
	   params.require(object).permit!
	
	end

end




# f = Dir.glob("#{Rails.root}/app/assets/images/*")
#f.map{|file| File.basename(file, File.extname(file))}

