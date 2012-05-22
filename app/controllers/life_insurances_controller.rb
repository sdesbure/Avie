class LifeInsurancesController < ApplicationController
  load_and_authorize_resource

  # GET /life_insurances
  # GET /life_insurances.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @life_insurances }
    end
  end

  # GET /life_insurances/1
  # GET /life_insurances/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @life_insurance }
    end
  end

  # GET /life_insurances/new
  # GET /life_insurances/new.json
  def new
    @life_insurance = LifeInsurance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @life_insurance }
    end
  end

  # GET /life_insurances/1/edit
  def edit
  end

  # POST /life_insurances
  # POST /life_insurances.json
  def create
    @life_insurance = LifeInsurance.new(params[:life_insurance])

    respond_to do |format|
      if @life_insurance.save
        format.html { redirect_to @life_insurance, notice: 'Life insurance was successfully created.' }
        format.json { render json: @life_insurance, status: :created, location: @life_insurance }
      else
        format.html { render action: "new" }
        format.json { render json: @life_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /life_insurances/1
  # PUT /life_insurances/1.json
  def update

    respond_to do |format|
      if @life_insurance.update_attributes(params[:life_insurance])
        format.html { redirect_to @life_insurance, notice: 'Life insurance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @life_insurance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_insurances/1
  # DELETE /life_insurances/1.json
  def destroy
    @life_insurance.destroy

    respond_to do |format|
      format.html { redirect_to life_insurances_url }
      format.json { head :no_content }
    end
  end
end
