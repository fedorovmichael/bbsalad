class PictureController < ApplicationController
  
  layout "admin", except: [:gallery]  
  before_filter :validate_admin, except: [:gallery]
  
  
  def index
      @pictures = Picture.where(product_id: [0,nil])#Picture.where("product_id=0 OR product_id is null")
   
   if @pictures.empty?
      @pictures.new
   end
   
   render 'index'  
  end

  def new
  end

  def create
     @pictures = Picture.create(unlock_params(:picture))      
     redirect_to picture_index_path
  end

  def show
  end

  def edit
   @pictures = Picture.find(params[:id])if params[:id] 
  
   render 'edit'
  end

  def update
     @pictures = Picture.find(params[:id])
	  @pictures.update_attributes(unlock_params(:picture))
	  
	 if @pictures.errors.empty?
	     flash.now[:success] = "Updated pictures successfully"    
	 else
	     flash.now[:error] = "Failed to update pictures"	    
	  end
	  
	  redirect_to edit_picture_path(@pictures)
  end

  def destroy
      @pictures = Picture.find(params[:id]) if params[:id]      
      @pictures.destroy
      redirect_to picture_index_path
  end
  
  def picture_handler 
     
    if(params[:addPicture])
      pic = Picture.create(link: params[:picture][:link], 
                             name: params[:picture][:name], 
                             position: params[:picture][:position], 
                             product_id: params[:picture][:product_id])
 
      
    elsif(params[:removePicture])
      
      pic = Picture.find(params[:picture][:id])
      pic.destroy 
        
    end
    
    redirect_to edit_admin_path(params[:picture][:product_id])
        
  end
  
  def gallery
   
   @pictures = Picture.where(product_id: [0,nil])
   
   if @pictures.empty?
      @pictures.new
   end
   @productDescription = ""
   @productTitle = "תמונות - לה צ'יפולה"
   render 'gallery'
   
  end
  
end
