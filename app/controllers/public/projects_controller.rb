class Public::ProjectsController < ApplicationController
  before_action :set_laboratory
  before_action ->{
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: [:new, :edit]

  def index
    @projects = Project.where(laboratory_id: @set_laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:info] = "projectを新規登録しました！"
      redirect_to public_laboratory_projects_path(@set_laboratory.id)
    else
      render "new"
    end

  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:info] = "projectを編集しました！"
      redirect_to public_laboratory_projects_path(@set_laboratory.id)
    else
      render "edit"
    end

  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      flash[:info] = "projectを削除しました！"
      redirect_to public_laboratory_projects_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end


  end

  private
  def project_params
    params.require(:project).permit(:title, :start_date, :end_date, :funding, :position, :linkpath, :laboratory_id)
  end

end
