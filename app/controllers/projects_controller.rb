class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def assignProject
    # @project=Project.find(params[:id])
    # if @project.update_attributes(project_params)
    #   if @project.update_attributes(project_params)
    #     flash[:success] = "Profile updated"
    #     redirect_to @project
    #   else
    #     flash.now[:warning] = 'Enter correct information.'
    #     render assignProject
    #   end
    # end

  end

  def projectBugs
    @bugs=Bug.where(project_id:params[:id])
    # respond_to do |format|
    #   format.html { redirect_to bugs_path }
    #   format.js
    # end
  end
  def qaBugs
    @bugs=Bug.where(add_id:params[:id])
  end
  def developerBugs
    @bugs=Bug.where(assign_id:params[:id])
  end
  def assign
     @projects=Project.where.not(assigned_id:nil)
  end
  def unAssign
    @projects=Project.where(assigned_id:nil)
  end
  # helper_method:assign
  helper_method:unAssign
  helper_method:developerBugs
  helper_method:qaBugs
  helper_method:projectBugs
  helper_method:assignProject
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :owner_id, :assigned_id)
    end
end
