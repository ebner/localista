class ItemsController < ApplicationController
  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end
  
  def search
    signed_in?(:member)
    @user = User.find(current_user.id)
    @location = @user.location
    if params[:name] == "all"
      @items = Item.where("`user_id`!= ?", current_user.id)
    else
      @items = Item.where("`name` LIKE ? AND NOT `user_id`=?", params[:name], current_user.id)
    end
  end
  
  # Get items from the logged in user
  def my_items
    signed_in?(:member)
    @items = Item.where("user_id = ?", current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end
  
  def about
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @location = @user.location
    @image = 'http://maps.google.com/maps/api/staticmap?center='+@location.lat.to_s+','+@location.long.to_s+'&markers='+@location.lat.to_s+','+@location.long.to_s+'&maptype=satellite&zoom=14&size=500x300&sensor=true'
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    signed_in?(:member)
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, :notice => 'Item was successfully created.' }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, :notice => 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
