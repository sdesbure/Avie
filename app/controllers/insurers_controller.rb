class InsurersController < ApplicationController
  load_and_authorize_resource

  # GET /insurers
  # GET /insurers.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insurers }
    end
  end

  # GET /insurers/1
  # GET /insurers/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurer }
    end
  end

  # GET /insurers/new
  # GET /insurers/new.json
  def new
    @insurer = Insurer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insurer }
    end
  end

  # GET /insurers/1/edit
  def edit
  end

  # POST /insurers
  # POST /insurers.json
  def create
    @insurer = Insurer.new(params[:insurer])

    respond_to do |format|
      if @insurer.save
        format.html { redirect_to @insurer, notice: 'Insurer was successfully created.' }
        format.json { render json: @insurer, status: :created, location: @insurer }
      else
        format.html { render action: "new" }
        format.json { render json: @insurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurers/1
  # PUT /insurers/1.json
  def update

    respond_to do |format|
      if @insurer.update_attributes(params[:insurer])
        format.html { redirect_to @insurer, notice: 'Insurer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @insurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurers/1
  # DELETE /insurers/1.json
  def destroy
    @insurer.destroy

    respond_to do |format|
      format.html { redirect_to insurers_url }
      format.json { head :no_content }
    end
  end
end
