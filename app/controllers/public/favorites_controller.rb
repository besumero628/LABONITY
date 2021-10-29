class Public::FavoritesController < ApplicationController
  before_action :set_user, only: [:index]
  
  def index
    @favorites = Favorite.where(user_id: @user.id)
  end

  def create
    @favorite = Favorite.new(deliverable_type: params[:type], deliverable_id: params[:id], user_id: current_user.id)
    
    case params[:type]
    when "Paper"
      @deliverable = Paper.find(params[:id])
    when "Book"
      @deliverable = Book.find(params[:id])
    when "Confernce"
      @deliverable = Confernce.find(params[:id])
    when "Event"
      @deliverable = Event.find(params[:id])
    end

    if !@favorite.save
      flash[:danger] = "不明なエラーです!"
      redirect_to session[:previous_url]
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(deliverable_type: params[:type], deliverable_id: params[:id], user_id: current_user.id)
    
    case params[:type]
    when "Paper"
      @deliverable = Paper.find(params[:id])
    when "Book"
      @deliverable = Book.find(params[:id])
    when "Confernce"
      @deliverable = Confernce.find(params[:id])
    when "Event"
      @deliverable = Event.find(params[:id])
    end
    
    if !@favorite.destroy
      flash[:danger] = "不明なエラーです"
      redirect_to session[:previous_url]
    end
  end

end
