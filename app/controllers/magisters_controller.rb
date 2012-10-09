class MagistersController < ApplicationController
  # GET /magisters
  # GET /magisters.json
  def index
    @magisters = Magister.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @magisters }
    end
  end

  # GET /magisters/1
  # GET /magisters/1.json
  def show
    @magister = Magister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @magister }
    end
  end

  # GET /magisters/new
  # GET /magisters/new.json
  def new
    @magister = Magister.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @magister }
    end
  end

  # GET /magisters/1/edit
  def edit
    @magister = Magister.find(params[:id])
  end

  # POST /magisters
  # POST /magisters.json
  def create
    @magister = Magister.new(params[:magister])

    respond_to do |format|
      if @magister.save
        format.html { redirect_to @magister, notice: 'Magister was successfully created.' }
        format.json { render json: @magister, status: :created, location: @magister }
      else
        format.html { render action: "new" }
        format.json { render json: @magister.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /magisters/1
  # PUT /magisters/1.json
  def update
    @magister = Magister.find(params[:id])

    respond_to do |format|
      if @magister.update_attributes(params[:magister])
        format.html { redirect_to @magister, notice: 'Magister was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @magister.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magisters/1
  # DELETE /magisters/1.json
  def destroy
    @magister = Magister.find(params[:id])
    @magister.destroy

    respond_to do |format|
      format.html { redirect_to magisters_url }
      format.json { head :no_content }
    end
  end

