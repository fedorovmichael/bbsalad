class AdminController < ApplicationController

   layout "admin"
   before_filter :validate_admin


  def index
  
   @products = Product.all   
   @products = @products.includes(:pictures)   

   render 'index'

  end
  
  def show
  end
  
  def new
  
   @product = Product.new
   @picture = Array.new
  
   render 'new'
  
  end
  
  def create
   
   @product = Product.create(unlock_params(:product))
   
   if @product.errors.empty?
      @picture = Array.new
      redirect_to edit_admin_path(@product)
   elsif
      render 'create'
   end  
  
  end
  
  def edit 

   @product = Product.find(params[:id])if params[:id]
   @pictures = Picture.where("product_id = ?", params[:id])if params[:id]
  
   if @pictures.empty?
      @pictures = Array.new
   end
   
   render 'edit'
   
  end
  

  def update
	 
	  @product = Product.find(params[:id])
	  @product.update_attributes(unlock_params(:product))

	  if @product.errors.empty?
	     flash.now[:success] = "Updated product successfully"    
	 else
	     flash.now[:error] = "Failed to update product"	    
	  end
	  
	  redirect_to edit_admin_path(@product)
	  
	end
    	
	def destroy
	
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: "index"
	
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
  
  
  def menu_handler
  
      case params[":item"]
      when "product"
        puts render partial: "shared/create_product"
      when "user"
        puts render partial: "shared/create_user"
      else
        puts render "create"
      end  
  
  end

end
