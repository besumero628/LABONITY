class Public::UserConferncesController < ApplicationController
  before_action :set_user

  def index
    @confernces = Confernce.all
  end

  def show
    @confernce = Confernce.find(params[:id])
  end

  def new
    @confernce = Confernce.new
  end

  def edit
    @confernce = Confernce.find(params[:id])
  end

  def create
    # render plain: params.inspect
    @confernce = Confernce.new(confernce_params)

    if @confernce.save
      @author = Author.new(deliverable_type: "Confernce", deliverable_id: @confernce.id, user_id: @user.id)
      @author.save
      flash[:info] = "論文を新規登録しました！"
      redirect_to public_user_user_confernces_path(@user.login_id)
    else
      set_user
      render "new"
    end

  end
  
  def update
    @confernce = Confernce.find(params[:id])
    
    if @confernce.update(confernce_params)
      flash[:info] = "論文を編集しました！"
      redirect_to public_user_user_confernces_path(@user.login_id)
    else
      set_user
      render "edit"
    end
  end
  
  def destroy
    @confernce = Confernce.find(params[:id])
    
    if @confernce.destroy
      flash[:info] = "論文を削除しました！"
      redirect_to public_user_user_confernces_path(@user.login_id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end

  end

  private
  def confernce_params
    params.require(:confernce).permit(:name, :title, :abstract, :figure, :linkpath)
  end
end
