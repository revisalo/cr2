class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @pensum = Pensum.find(params[:id])
    @subject = @pensum.subjects.build
#    @subject = Subject.new
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @subject }
#    end
  end

  # GET /subjects/1/edit
  def edit

    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @pensum = Pensum.find(params[:id])
    @subject = @pensum.subjects.build(params[:subject])    

    @subject.save
      redirect_to new_subject_path(:id => @pensum.id)
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end
end