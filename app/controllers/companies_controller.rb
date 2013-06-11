class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    user = User.find(current_user.id)
    
    respond_to do |format|
      if @company.save
        user.company_id = @company.id
        user.state = 'active'
        user.save!
        format.html { redirect_to registration_products_path, notice: 'La empresa se ha creado correctamente.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'La empresa se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
  
  def join_to_company
   company = Company.find_by_cif(params[:cif])
   
   if(company == nil)
     flash[:notice] = "La empresa no existe, comprueba los datos introducidos"
     redirect_to :back
   end
       
   user = User.find(current_user.id)
   user.company_id = company.id
   user.save!
   
   respond_to do |format|
        event = Event.create(:object_id => current_user.id, :company_id => company.id, :type_mask => '1')
        event.save!
        session.destroy
        format.html {redirect_to home_hello_path, notice: "Se te notificará por email cuando el admin </br> te acepte en la empresa"}
    end
    
  end  
  
  
  def registration_companies
    @company = Company.new
  end
    
  #def process_join_to_company
    
  #  begin
  #  user = User.find(current_user.id)
  #  user.company_id = company.id
  #  user.save!
    
  #  respond_to do |format|
  #    format.js
  #  end
    
  #  rescue
  #    flash['error'] = 'Se ha producido un error inesperado.'
  #  end   
   
  #end
  
end
