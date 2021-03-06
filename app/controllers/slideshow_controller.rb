class SlideshowController < ApplicationController
  
  layout "admin"
  before_filter :validate_admin  
  
  def index
      @slideshow = Slideshow.all
      
      if @slideshow.empty?
         @slideshow.new
      end
            
      render 'index'  
  end
  
  def show
  end
  
  def new
  end

  def create
     @slideshow = Slideshow.create(unlock_params(:slideshow))      
     redirect_to slideshow_index_path
  end

  def update
     @slideshow = Slideshow.find(params[:id])
	  @slideshow.update_attributes(unlock_params(:slideshow))
	  
	 if @slideshow.errors.empty?
	     flash.now[:success] = "Updated slideshow successfully"    
	 else
	     flash.now[:error] = "Failed to update slideshow"	    
	  end
	  
	  redirect_to edit_slideshow_path(@slideshow)
  end

  def edit
  
   @slideshow = Slideshow.find(params[:id])if params[:id] 
  
   render 'edit'
  
  end

  def destroy  
      @slideshow = Slideshow.find(params[:id]) if params[:id]      
      @slideshow.destroy
      redirect_to slideshow_index_path
  end
  
end
