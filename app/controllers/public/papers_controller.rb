class Public::PapersController < ApplicationController
  before_action :set_laboratory
  before_action ->{
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: [:new, :edit]

  def index
    @papers = Paper.where(laboratory_id: @set_laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def create
    @paper = Paper.new(paper_params)
    
    if @paper.save
      flash[:info] = "論文を新規登録しました！"
      redirect_to public_laboratory_papers_path(@set_laboratory.id)
    else
      render "new"
    end
    
  end

  def update
    @paper = Paper.find(params[:id])
    
    if @paper.update(paper_params)
      flash[:info] = "論文を編集しました！"
      redirect_to public_laboratory_papers_path(@set_laboratory.id)
    else
      render "edit"
    end
    
  end

  def destroy
    @paper = Paper.find(params[:id])
    
    if @paper.destroy
      flash[:info] = "論文を削除しました！"
      redirect_to public_laboratory_papers_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :abstract, :figure, :linkpath, :laboratory_id)
  end

end
