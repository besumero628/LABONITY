class Public::UserPapersController < ApplicationController
  before_action :set_user

  def index
    @papers = Paper.all
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
    # render plain: params.inspect
    @paper = Paper.new(paper_params)

    if @paper.save
      @author = Author.new(deliverable_type: "Paper", deliverable_id: @paper.id, user_id: @user.id)
      @author.save
      flash[:info] = "論文を新規登録しました！"
      redirect_to public_user_user_papers_path(@user.login_id)
    else
      set_user
      render "new"
    end

  end
  
  def update
    @paper = Paper.find(params[:id])
    
    if @paper.update(paper_params)
      flash[:info] = "論文を編集しました！"
      redirect_to public_user_user_papers_path(@user.login_id)
    else
      set_user
      render "edit"
    end
  end
  
  def destroy
    @paper = Paper.find(params[:id])
    
    if @paper.destroy
      flash[:info] = "論文を削除しました！"
      redirect_to public_user_user_papers_path(@user.login_id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end

  end

  private
  def paper_params
    params.require(:paper).permit(:title, :abstract, :figure, :linkpath)
  end

end
