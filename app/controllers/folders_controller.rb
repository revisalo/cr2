class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    #@magisterF = Magister.find_by_code(params[:folder][:magisterName])

    #Search for the active pensum for that magister
    @pensumF = Pensum.where(:magister_id => params[:folder][:magisterName]).first
    #If the pensum exist create the folder with the pensum id for the magister
    if @pensumF != nil
      @folder = Folder.new(params[:folder].merge(:pensum_id => @pensumF.id))
    
     respond_to do |format|
        if @folder.save
          format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
          format.json { render json: @folder, status: :created, location: @folder }
        else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
        end
      end
      #if the pensum doesnt exist redirects to the metod errorMaestria
    else respond_to do |format|
        format.html { render action: "errorMaestria" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def fap
    redirect_to subjects_url  
  end
  helper_method :fap
  
  #Metod that redirects to the view page of the error "errorMaetria"
  def errorMaestria
    respond_to do |format|
      format.html  errorMaestria.html.erb
    end
  end
end
