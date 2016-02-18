class HomeController < ApplicationController
  def index
      
      @new_product =  Product.includes(:pictures).where("new = ?", true ).limit(3)      
      @favorints_product =  Product.includes(:pictures).where("favorits=?", true ).limit(3)    
  
      render 'index'
      
  end
end
