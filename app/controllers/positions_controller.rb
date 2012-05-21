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
    @support = find_support

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @support = find_support
    @klass = find_support_class if @support.nil?
    Rails.logger.debug @support.class.to_s.underscore.to_sym

    unless @support.nil? && @klass.nil?
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
  end

  # POST /positions
  # POST /positions.json
  def create
    @support = find_support

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
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
      Rails.logger.debug "Start finding support"
      Rails.logger.debug  Position::SUPPORTS_WHITE_LIST
      params.each do |name, value|
        Rails.logger.debug "#{name}: #{value}"
        if name =~ /(.+)_id$/
          Rails.logger.debug $1.classify.constantize
          return $1.classify.constantize.find(value) if Position::SUPPORTS_WHITE_LIST.include?($1.to_sym)
        end
      end
      nil
    end

    def find_support_class
      Rails.logger.debug "Start finding support path"
      Rails.logger.debug request.fullpath
      request.fullpath.split('/').each do |path|
        Rails.logger.debug path
        return path.singularize.to_sym if Position::SUPPORTS_WHITE_LIST.include?(path.singularize.to_sym)
      end
      nil
    end
end
