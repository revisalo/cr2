class PensumsController < ApplicationController
  # GET /pensums
  # GET /pensums.json
  def index
    @pensums = Pensum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pensums }
    end
  end

  # GET /pensums/1
  # GET /pensums/1.json
  def show
    @pensum = Pensum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pensum }
    ender
error: The requested URL returned error: 40
  end

  # GET /pensums/new
  # GET /pensums/new.json
  def new
    @pensum = Pensum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pensum }
    end
  end

  # GET /pensums/1/edit
  def edit
    @pensum = Pensum.find(params[:id])
  end

  # POST /pensums
  # POST /pensums.json
  def create
    @pensum = Pensum.new(params[:pensum])

    respond_to do |format|
      if @pensum.save
        format.html { redirect_to @pensum, notice: 'Pensum was successfully created.' }
        format.json { render json: @pensum, status: :created, location: @pensum }
      else
        format.html { render action: "new" }
        format.json { render json: @pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pensums/1
  # PUT /pensums/1.json
  def update
    @pensum = Pensum.find(params[:id])

    respond_to do |format|
      if @pensum.update_attributes(params[:pensum])
        format.html { redirect_to @pensum, notice: 'Pensum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pensum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pensums/1
  # DELETE /pensums/1.json
  def destroy
    @pensum = Pensum.find(params[:id])
    @pensum.destroy

    respond_to do |format|
      format.html { redirect_to pensums_url }
      format.json { head :no_content }
    end
  end


end
