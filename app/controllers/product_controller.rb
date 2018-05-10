class ProductController < ApplicationController
  def index
      @current_caption = ''
      @hashTypes = Hash.new(0)
      type_name = ''
 
      @productTypes = ProductType.all
      
      @productTypes.each do |type|
         @products = Product.where(['product_type = ? and enable = ?', type.name, true])
         if !@products.blank?
            type_name = page_caption(type.name)
            @hashTypes[type_name] = @products
            @current_caption = type_name
         end
      end
      
      @productDescription = "טוסטים,המבורגר טבעוני,סלטים בהרכבה עצמית,סלטים,כריכים,מרקים,צמחוני,קייטרינג,מגש סלמון,מגש גבינות,מגש ירקות,מגש כריכים,כריכים בהרכבה עצמית"
      @productTitle = "טוסטים,המבורגר טבעוני,סלטים בהרכבה עצמית,סלטים,כריכים,מרקים,צמחוני,כריכים בהרכבה עצמית - לה צ'יפולה"
      
      #@products = Product.where('product_type = ?',params[:product_type])
      #@products = @products.includes(:pictures)      
      #page_caption
      #@products = valid_picture(@products)      
      render 'index'
  end

  def show
      @product = Product.find(params[:id])
      @productDescription = @product.overview
      @productTitle = @product.name + " - לה צ'יפולה"
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
  
  def page_caption(cur_type)
      
      current_type = ''
            
      case cur_type      
      when 'soups'
        current_type = 'מרקים'
      when 'sandwiches'
        current_type = 'כריכים'
      when 'smallsalad'
        current_type = 'סלטים קטנים'
      when 'bigsalad'
        current_type = 'סלטים גדולים'
      when 'business'
        current_type = 'עסקיות'      
      when 'hot'
        current_type = 'מנות מיוחדות'
      when 'catering'
        current_type = 'קייטרינג'
      end
      
      current_type
      
  end
  
end
