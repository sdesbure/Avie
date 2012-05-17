class LifeInsuranceContractsController < ApplicationController
  load_and_authorize_resource

  # GET /life_insurance_contracts
  # GET /life_insurance_contracts.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @life_insurance_contracts }
    end
  end

  # GET /life_insurance_contracts/1
  # GET /life_insurance_contracts/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @life_insurance_contract }
    end
  end

  # GET /life_insurance_contracts/new
  # GET /life_insurance_contracts/new.json
  def new
    @life_insurance_contract = LifeInsuranceContract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @life_insurance_contract }
    end
  end

  # GET /life_insurance_contracts/1/edit
  def edit
  end

  # POST /life_insurance_contracts
  # POST /life_insurance_contracts.json
  def create
    @life_insurance_contract = LifeInsuranceContract.new(params[:life_insurance_contract])

    respond_to do |format|
      if @life_insurance_contract.save
        format.html { redirect_to @life_insurance_contract, notice: 'Life insurance contract was successfully created.' }
        format.json { render json: @life_insurance_contract, status: :created, location: @life_insurance_contract }
      else
        format.html { render action: "new" }
        format.json { render json: @life_insurance_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /life_insurance_contracts/1
  # PUT /life_insurance_contracts/1.json
  def update

    respond_to do |format|
      if @life_insurance_contract.update_attributes(params[:life_insurance_contract])
        format.html { redirect_to @life_insurance_contract, notice: 'Life insurance contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @life_insurance_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_insurance_contracts/1
  # DELETE /life_insurance_contracts/1.json
  def destroy
    @life_insurance_contract.destroy

    respond_to do |format|
      format.html { redirect_to life_insurance_contracts_url }
      format.json { head :no_content }
    end
  end
end
