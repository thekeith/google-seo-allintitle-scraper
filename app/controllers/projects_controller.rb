class ProjectsController < ApplicationController
  def index
    @projects = Project.all.paginate(page: params[:page], per_page: per_page)
    @title = "Projects Index"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  
  def new
    @project = Project.new
    @title = 'New Project'
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end
  
  def show
    redirect_to project_keywords_path(Project.find(params[:id]))
  end
  
  def edit
    @project = Project.find(params[:id])
    @title = 'Edit Project'
  end
  
  
  def create
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_keywords_path(@project), notice: 'project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @project = Project.find(params[:id])
    
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to project_keywords_path(@project), notice: 'project was successfully updated.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
    
    def per_page
      25
    end
end
