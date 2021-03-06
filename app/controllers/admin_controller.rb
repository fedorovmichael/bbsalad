class AdminController < ApplicationController

   layout "admin"
   before_filter :validate_admin


  def index
  
   @products = Product.order(:product_type).all   
   @products = @products.includes(:pictures)
   
   @product = Product.new  

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
      when "product_list"
        puts redirect_to admin_index_path
      when "product"
        puts render partial: "shared/create_product"
      when "user"
        puts render partial: "shared/create_user"
      else
        puts render "create"
      end  
  
  end
  
  def change_status      
      @product = Product.find(params[:id])      
      @product.update_attribute(:enable, params[:enable])
  end
  
  def change_favorit_status
      @product = Product.find(params[:id])      
      @product.update_attribute(:favorits, params[:favorits])
  end
  
  def sort_by_product_type      
      @selected_product_type = params[:product][:product_type]       
      if params[:product][:product_type].empty?
         @products = Product.order(:product_type).all
      else
         @products = Product.where("product_type = ?", params[:product][:product_type])
      end
      @products = @products.includes(:pictures)
      @product = Product.new   
      render 'index'
  end

end

