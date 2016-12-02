class Item < ActiveRecord::Base

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/images/#{file_name}",'wb'){|f| f.write(file.read)}
      self.image = file_name
    end

  end

end
