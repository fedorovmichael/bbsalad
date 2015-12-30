class ProductController < ApplicationController
  def index
      @products = Product.where('product_type = ?',params[:product_type])
      @products = @products.includes(:pictures)      
      #@products = valid_picture(@products)      
      render 'index'
  end

  def show
      @product = Product.find(params[:id])
      
      #if @product.pictures.empty?         
       #  @product.pictures << create_picture
      #end
           
      render 'show'
  end
  
  def search
  
      if params[:search] 
         @products = Product.where('name = ?', params[:search])
         @products = @products.includes(:pictures)         
      end
      
      #@products = valid_picture(@products)
      render 'index'
  end
  
  private
  
  def valid_picture(prod)
  
      prod.each do |p|
         if p.pictures[0] == nil
            p.pictures[0] = create_picture
         end
      end
      
      prod      
  end
  
  def create_picture
      Picture.new(name: '100_0646', link: '100_0646.bmp', position: '1', product_id: params[:id])
  end
  
end
