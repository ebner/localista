class LocationsController < ApplicationController

 def show
   
   @json = Location.all.to_gmaps4rails
   
 end
 
end