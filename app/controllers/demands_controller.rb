class DemandsController < ApplicationController
  # GET /demands
  # GET /demands.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @demands = Demand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demands }
    end
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand = Demand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @demand }
    end
  end

  # GET /demands/new
  # GET /demands/new.json
  def new
    @line_item = LineItem.new
    @demand = Demand.last
    if @demand.nil?
      @demand = Demand.create
    elsif @demand.client_id.nil?
        @demand
      else
        @demand = Demand.create
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @demand }
    end
  end

  # GET /demands/1/edit
  def edit
    @demand = Demand.find(params[:id])
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Demand.new(params[:id])

    respond_to do |format|
      if @demand.save
        format.html { redirect_to :back, notice: 'Demand was successfully created.' }
        format.json { render json: @demand, status: :created, location: @demand }
      else
        format.html { render action: "new" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /demands/1
  # PUT /demands/1.json
  def update
    @demand = Demand.find(params[:id])
    client = Client.find_by_name(params[:client])

    @demand.client_id = client.id
    @demand.state = params[:state]
    @demand.user_id = params[:demand][:user_id]
    
    @demand.save!
    respond_to do |format|
      if @demand.save
        format.html { render action: "create_bill", :object => @demand = @demand }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand = Demand.find(params[:id])
    @demand.destroy

    respond_to do |format|
      format.html { redirect_to demands_url }
      format.json { head :no_content }
    end
  end
  
  def autocomplete_client_name
    @clients = Client.where(["LOWER(name) LIKE ? AND user_id=?", "#{params[:term].downcase}%", current_user.id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end
  
  def autocomplete_product_title
    @products = Product.where(["LOWER(title) LIKE ? AND user_id=?", "#{params[:term].downcase}%", current_user.id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
  
  def create_line_item  
     @line_item = LineItem.new(params[:line_item])
     @product = Product.find_by_title(params[:product])
     @line_item.product_id = @product.id
     
     @line_items = LineItem.where(:demand_id => @line_item.demand_id, :product_id => @line_item.product_id)
     @quantity = @line_item.quantity
     
     if @line_items != nil      
       @line_items.each do |item|
         @quantity += item.quantity
         LineItem.find(item.id).destroy
       end
      @line_item.update_attributes(:quantity => @quantity)
     end
    
     respond_to do |format|
        if @line_item.save
          format.js
        else
          format.html { render action: "new" }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
     end
  end
  
  def line_items_table
    @demand = Demand.last
     if @demand.nil?
      @demand = Demand.create
    elsif @demand.client_id.nil?
        @demand
      else
        @demand = Demand.create
    end
    
    line_items = LineItem.where(:demand_id => @demand.id)
    
    @line_item_array = Array.new
    unless line_items.nil?
      line_items.each do |l|
        unless l.product_id.nil?
          @line_item_array << l
        end  
      end
    end
    @line_item_array
  end
  
  def create_bill
    @client_name = params[:client]
    @company = Company.find(current_user.company_id)
    @client = Client.find_by_name(@client_name)
    @demand = Demand.find(params[:id])
    @line_items = LineItem.where(@demand.id)
  end
  
  
end
