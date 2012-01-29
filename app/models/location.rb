class Location < ActiveRecord::Base
  belongs_to :item
  acts_as_gmappable :lat => "lat", :lng => "long", :validation => true
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}" 
  end
  
  def gmaps4rails_infowindow
    the_user = User.find(self.user_id)
    text = "<h4>#{the_user.name} has available:</h4>"
    if the_user.items != nil
      the_user.items.each do |i|
        text += "<p>#{i.name}</p>"
      end
    end
    return text
  end
  
end
