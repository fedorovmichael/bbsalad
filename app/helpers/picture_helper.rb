module PictureHelper

   def get_pictures_names
      f = Dir.glob("#{Rails.root}/app/assets/images/*") 
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
   
   def get_slideshow_pictures
       slideshows = Slideshow.all
       slideshows
   end
   

end
