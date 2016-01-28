class PictureController < ApplicationController
  before_filter :validate_admin
  
  
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
end
