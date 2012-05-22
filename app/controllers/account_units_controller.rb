class AccountUnitsController < ApplicationController
  load_and_authorize_resource

  # GET /account_units
  # GET /account_units.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_units }
    end
  end

  # GET /account_units/1
  # GET /account_units/1.json
  def show
    @active = !request.url.include?("show_all_positions")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_unit }
    end
  end

  # GET /account_units/new
  # GET /account_units/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_unit }
    end
  end

  # GET /account_units/1/edit
  def edit
  end

  # POST /account_units
  # POST /account_units.json
  def create

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
    @account_unit.destroy

    respond_to do |format|
      format.html { redirect_to account_units_url }
      format.json { head :no_content }
    end
  end
end
