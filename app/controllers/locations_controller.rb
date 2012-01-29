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
   @user = User.find(current_user.id)
   if @user.location
     @loc = @user.location
    end
 end
 
 def new
   @loc = Location.new
   @user = User.find(current_user.id)
   @loc.user = @user
 end

 def update
   @user = User.find(current_user.id)
   @location = @user.location
   puts "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
   puts params[:longitude]
   @location.long = params[:longitude]
   @location.lat = params[:latitude]
   @location.save
   redirect_to @location
end
end