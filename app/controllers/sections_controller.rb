class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
    
        respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    
  end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    
   @section = Section.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
     end
   
  end


  

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new
       respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create

      system("echo ++++++++++++++++++++")
      system("echo ++++++++++++++++++++")
      system("echo ++++++++++++++++++++")
      system("echo ++++++++++++++++++++")
      system("echo ++++++++++++++++++++")
    if params[:id]=="-1"
     leer
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
     system("echo ++++++++++++++++++++")
    else
    
    @pensum = Pensum.find(params[:id])

    @pensum = Pensum.find(params[:id])
    if params[:id]=="1"
      escribir
      leer
      redirect_to new_section_path(:id => @pensum.id)
    else
    

    @section = @pensum.sections.build(params[:section])    
    @section.save
      redirect_to new_section_path(:id => @pensum.id)
    end
    
    
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end

  def leer
    
       counter = 1
   file = File.new("ejemplo.txt", "r")
   while (line = file.gets)
      puts "#{counter}: #{line}"
      counter = counter + 1
 
  file.close

   end
 end



  def escribir

    File.open('/home/san/julian.data', 'w') do |f|
    f.puts params
  end
  
end
