class HomeController < ApplicationController
  def index

      @new_product =  Product.order(:product_type).includes(:pictures).where("new = ?", true)
      @favorints_product =  Product.order(:product_type).includes(:pictures).where("favorits = ?", true)
      @catering_product = Product.includes(:pictures).where(['product_type = ? and enable = ?', 'catering', true])
      @productDescription = "טוסטים,המבורגר טבעוני,סלטים בהרכבה עצמית,סלטים,כריכים,מרקים,צמחוני,כריכים בהרכבה עצמית"
      @productTitle = "טוסטים,המבורגר טבעוני,סלטים בהרכבה עצמית,סלטים,כריכים,מרקים,צמחוני,כריכים בהרכבה עצמית - לה צ'יפולה"
      render 'index'
      
  end
  
  def contact
   @productDescription = "לה צ'יפולה קייטרינג צמחני, טבעוני, ארוחות צהריים, עסקיות ,טלפון: 0587267676, שעות פעילות : א-ה 8:00-15:30 ניתן למצוא אותנו גם בפייסבוק"
   @productTitle = "איך מגיעים - לה צ'יפולה"  
   render 'contact'
  end
end
