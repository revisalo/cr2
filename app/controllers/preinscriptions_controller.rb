class PreinscriptionsController < ApplicationController
  # GET /preinscriptions
  # GET /preinscriptions.json
  def index
    @preinscriptions = Preinscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preinscriptions }
    end
  end

  # GET /preinscriptions/1
  # GET /preinscriptions/1.json
  def show
    @pensum = Pensum.find(params[:id])
    @preinscriptions = @pensum.preinscriptions

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preinscriptions }
    end
  end

  # GET /preinscriptions/new
  # GET /preinscriptions/new.json
  def new
    @preinscription = Preinscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preinscription }
    end
  end

  # GET /preinscriptions/1/edit
  def edit
    @preinscription = Preinscription.find(params[:id])
  end

  # POST /preinscriptions
  # POST /preinscriptions.json
  def create
    @preinscription = Preinscription.new(params[:preinscription])

    respond_to do |format|
      if @preinscription.save
        format.html { redirect_to @preinscription, notice: 'Preinscription was successfully created.' }
        format.json { render json: @preinscription, status: :created, location: @preinscription }
      else
        format.html { render action: "new" }
        format.json { render json: @preinscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /preinscriptions/1
  # PUT /preinscriptions/1.json
  def update
    @preinscription = Preinscription.find(params[:id])

    respond_to do |format|
      if @preinscription.update_attributes(params[:preinscription])
        format.html { redirect_to @preinscription, notice: 'Preinscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preinscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preinscriptions/1
  # DELETE /preinscriptions/1.json
  def destroy
    @preinscription = Preinscription.find(params[:id])
    @preinscription.destroy

    respond_to do |format|
      format.html { redirect_to preinscriptions_url }
      format.json { head :no_content }
    end
  end
end
