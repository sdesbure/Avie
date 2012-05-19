class AccountUnitsController < ApplicationController
  # GET /account_units
  # GET /account_units.json
  def index
    @account_units = AccountUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_units }
    end
  end

  # GET /account_units/1
  # GET /account_units/1.json
  def show
    @account_unit = AccountUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_unit }
    end
  end

  # GET /account_units/new
  # GET /account_units/new.json
  def new
    @account_unit = AccountUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_unit }
    end
  end

  # GET /account_units/1/edit
  def edit
    @account_unit = AccountUnit.find(params[:id])
  end

  # POST /account_units
  # POST /account_units.json
  def create
    @account_unit = AccountUnit.new(params[:account_unit])

    respond_to do |format|
      if @account_unit.save
        format.html { redirect_to @account_unit, notice: 'Account unit was successfully created.' }
        format.json { render json: @account_unit, status: :created, location: @account_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @account_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account_units/1
  # PUT /account_units/1.json
  def update
    @account_unit = AccountUnit.find(params[:id])

    respond_to do |format|
      if @account_unit.update_attributes(params[:account_unit])
        format.html { redirect_to @account_unit, notice: 'Account unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_units/1
  # DELETE /account_units/1.json
  def destroy
    @account_unit = AccountUnit.find(params[:id])
    @account_unit.destroy

    respond_to do |format|
      format.html { redirect_to account_units_url }
      format.json { head :no_content }
    end
  end
end