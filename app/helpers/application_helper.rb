module ApplicationHelper

   #return row counts
   def RowCounts(products)
                 
     rcount = products.length > 4 ? products.length / 4 : 1
     
     if(products.length % 4 > 0)
         rcount += 1
     end
     
     rcount
      
   end

end
