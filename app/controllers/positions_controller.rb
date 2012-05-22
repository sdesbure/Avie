class PositionsController < ApplicationController
  load_and_authorize_resource

  # GET /positions
  # GET /positions.json
  def index
    @support = find_support

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/new_euro_fund
  # GET /positions/new_euro_fund.json
  def new_euro_fund
    new_on(EuroFund)
  end

  # GET /positions/new_account_unit
  # GET /positions/new_account_unit.json
  def new_on_account_unit
    new_on(AccountUnit)
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @support = find_support
    @position.support = @support

    unless @support.nil?
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @position }
      end
    else
      respond_to do |format|
        format.html { redirect_to positions_path, error: t('must_give_support') }
        format.json { render json: @position}
      end
    end
  end

  # GET /positions/1/edit
  def edit
      @supports = @position.support_type.constantize.all
  end

  # POST /positions
  # POST /positions.json
  def create
    @support = find_support
    puts @position.inspect
    @position.support = @support unless @support.nil?

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        @support ||= @position.support
        klass = @position.support_type.nil? ? AccountUnit : @position.support_type.constantize
        @supports = klass.all
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy

    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :no_content }
    end
  end

  private
    def find_support
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value) if Position::SUPPORTS_WHITE_LIST.include?($1.to_sym)
        end
      end
      nil
    end

    def new_on(klass)
      @position = Position.new
      @position.support_type = klass
      @position.user = current_user
      life_insurance_contract = LifeInsuranceContract.find(params[:life_insurance_contract_id]) unless params[:life_insurance_contract_id].nil?
      @supports = klass.all

      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @position }
      end
    end
end
