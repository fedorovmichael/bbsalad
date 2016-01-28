module PictureHelper

   def get_pictures_names
      f = Dir.glob("#{Rails.root}/app/assets/images/*") 
      f.map{|file| File.basename(file, File.extname(file))}
   end

end
