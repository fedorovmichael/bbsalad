module ApplicationHelper

   #return row counts
   def RowCounts(products)
                 
     rcount = products.length > 4 ? products.length / 4 : 1
     
     if(products.length % 4 > 0)
         rcount += 1
     end
     
     rcount
      
   end
   
  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end
   
  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end

end
