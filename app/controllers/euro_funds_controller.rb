class EuroFundsController < ApplicationController
  load_and_authorize_resource

  # GET /euro_funds
  # GET /euro_funds.json
  def index
    @euro_funds = EuroFund.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @euro_funds }
    end
  end

  # GET /euro_funds/1
  # GET /euro_funds/1.json
  def show
    @euro_fund = EuroFund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @euro_fund }
    end
  end

  # GET /euro_funds/1/show_all_positions
  # GET /euro_funds/1/show_all_positions.json
  def show
    @euro_fund = EuroFund.find(params[:id])

    respond_to do |format|
      format.html { render 'show' } # show.html.erb
      format.json { render json: @euro_fund.positions }
    end
  end

  # GET /euro_funds/new
  # GET /euro_funds/new.json
  def new
    @euro_fund = EuroFund.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @euro_fund }
    end
  end

  # GET /euro_funds/1/edit
  def edit
    @euro_fund = EuroFund.find(params[:id])
  end

  # POST /euro_funds
  # POST /euro_funds.json
  def create
    @euro_fund = EuroFund.new(params[:euro_fund])

    respond_to do |format|
      if @euro_fund.save
        format.html { redirect_to @euro_fund, notice: 'Euro fund was successfully created.' }
        format.json { render json: @euro_fund, status: :created, location: @euro_fund }
      else
        format.html { render action: "new" }
        format.json { render json: @euro_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /euro_funds/1
  # PUT /euro_funds/1.json
  def update
    @euro_fund = EuroFund.find(params[:id])

    respond_to do |format|
      if @euro_fund.update_attributes(params[:euro_fund])
        format.html { redirect_to @euro_fund, notice: 'Euro fund was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @euro_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /euro_funds/1
  # DELETE /euro_funds/1.json
  def destroy
    @euro_fund = EuroFund.find(params[:id])
    @euro_fund.destroy

    respond_to do |format|
      format.html { redirect_to euro_funds_url }
      format.json { head :no_content }
    end
  end
end
