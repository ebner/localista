class LocationsController < ApplicationController

  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

 def show
   @json = Location.all.to_gmaps4rails do |location, marker|
    # marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user})
     case location.user.category
     when "fish" 
       marker.picture({:picture => "/icons/fish.png",:width   => "50",:height  => "50"}) 
     when "fruit" 
       marker.picture({:picture => "/icons/apple.png",:width   => "50",:height  => "50"}) 
     when "meat" 
       marker.picture({:picture => "/icons/meat.png",:width   => "50",:height  => "50"}) 
     when "grains" 
       marker.picture({:picture => "/icons/grains.png",:width   => "50",:height  => "50"})       
     when "venison" 
       marker.picture({:picture => "/icons/moose.png",:width   => "50",:height  => "50"}) 
     when "dairy" 
       marker.picture({:picture => "/icons/dairy.png",:width   => "50",:height  => "50"}) 
     else
       marker.picture({:picture => "/icons/farm.png",:width   => "50",:height  => "50"})
     end
     
     #marker.title   "i'm the title"
     #marker.sidebar "i'm the sidebar"
     marker.json({ :id => location.id, :foo => "bar" })
   end
 end
 
 def edit
   
 end
 
 def new
   
 end

 def update
   @user = User.find(current_user.id)
   if @user.location
     @location = @user.location
   else
     @location = Location.new
     @location.user_id = @user.id
   end
   @location.lat = params[:latitude]
   @location.long = params[:latitude]
   @location.save
 end

end