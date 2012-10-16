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
    if (params[:id]=="-1")
      escribir
      system("/bin/bash ~/bash2.sh")
      leer
      redirect_to new_section_path(:id => params[:pensum_id])
    elsif (params[:id] == "-2")
      cargar_secciones
      redirect_to new_section_path(:id => params[:pensum_id])
    else
      @pensum = Pensum.find(params[:id])
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
    File.open("./files/result", "r") do |infile|

      Section.all.each do |sec|
        sec.provisional = 1    
        sec.save
          puts "................................."
          puts "#{sec.subject_id} #{sec.provisional}"
      end 
      while (line = infile.gets)
          #puts "#{counter}: #{line}"
          datos = line.split(';')
          code = datos[0]
          day = datos[1]
          hour = datos[2]
          
          section = Section.where(:subject_id => code, :day => day, :hour => hour).first
          puts "**************************** #{section.subject_id}"
          section.provisional = 0
          section.save
          puts "#{section.provisional}"
      end
    end
  end


  def escribir
    @pensum = Pensum.find(params[:pensum_id])
    #File.open('/home/san/julian.data', 'w') do |f|
    File.open('./files/data', 'w') do |f|
      f.puts @pensum.subjects.count
      f.puts "----------"
      @pensum.subjects.each do |sub|
        f.puts "#{sub.code};#{sub.capacity};#{sub.blocks}" 
      end
      f.puts "----------"
      @pensum.subjects.each do |sub|
        @pensum.sections.each do |sec|
          if (sec.subject_id == sub.code)
            f.puts "#{sub.code};#{sec.day};#{sec.hour}"
          end
        end
      end
      f.puts "----------"
    end
  end

  def cargar_secciones
    File.open("./files/sections_load.csv", "r") do |infile|
      line = infile.gets
      while (line = infile.gets)
        line = line.strip
          datos = line.split(';')
          code = datos[0]
          day = datos[1]
          hour = datos[2]
          
          @pensum = Pensum.find(params[:pensum_id])
          @section = @pensum.sections.build("{\"day\"=>\"#{day}\",\"hour\"=>\"#{hour}\",\"subject_id\"=>\"#{code}\",\"provisional\"=>\"0\"}")    
          @section.save
          puts "**************************** #{section.subject_id} */*/*/*/*/*/*/*/*/*/*/"
      end
    end
  end

end