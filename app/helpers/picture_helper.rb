module PictureHelper

   def get_pictures_names
      f = Dir.glob("#{Rails.root}/app/assets/images/product/*") 
      f.map{|file| File.basename(file)}
      #f.map{|file| File.basename(file, File.extname(file))} #without extention name            
   end
   
   def get_picture_link(pictures, index = 0)
       picture = ''
       
       if index.blank?
         index = 0
       end
       
       if pictures.empty?
         picture = "salad.jpg"
       else         
         picture = pictures[index].link
       end
       
       picture
   end

end
