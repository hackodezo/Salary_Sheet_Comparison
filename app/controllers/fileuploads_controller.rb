class FileuploadsController < ApplicationController
  before_action :set_fileupload, only: [:show, :edit, :update, :destroy]

  # GET /fileuploads
  # GET /fileuploads.json
  def index
    @fileuploads = Fileupload.all
  end

  # GET /fileuploads/1
  # GET /fileuploads/1.json
  def show

  end

  # GET /fileuploads/new
  def new
    @fileupload = Fileupload.new
  end

  # GET /fileuploads/1/edit
  def edit
  end

  # POST /fileuploads
  # POST /fileuploads.json
  def create
    @fileupload = Fileupload.new
    @fileupload.project_name = params[:project_name]
    @fileupload.file_name = params[:file_name]
    @fileupload.start = params[:start]
    @fileupload.end = params[:end]
    @fileupload.unique = params[:unique]
    @fileupload.last_row = params[:last_row]
    Makemodel.import(params[:excel_file],params[:project_name],params[:file_name],params[:start],params[:end],params[:unique],params[:last_row])


    respond_to do |format|
      if @fileupload.save
        format.html { redirect_to @fileupload, notice: 'Fileupload was successfully created.' }
        format.json { render :show, status: :created, location: @fileupload }
      else
        format.html { render :new }
        format.json { render json: @fileupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fileuploads/1
  # PATCH/PUT /fileuploads/1.json
  def update
    respond_to do |format|
      if @fileupload.update(fileupload_params)
        format.html { redirect_to @fileupload, notice: 'Fileupload was successfully updated.' }
        format.json { render :show, status: :ok, location: @fileupload }
      else
        format.html { render :edit }
        format.json { render json: @fileupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fileuploads/1
  # DELETE /fileuploads/1.json
  def destroy
    @fileupload.destroy
    respond_to do |format|
      format.html { redirect_to fileuploads_url, notice: 'Fileupload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fileupload
      @fileupload = Fileupload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fileupload_params
      params.require(:fileupload).permit(:project_name, :file_name, :start, :end, :unique, :last_row , :excel_file)
    end
end
