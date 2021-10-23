class Public::FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(deliverable_type: params[:type], deliverable_id: params[:id], user_id: current_user.id)
    @paper = Paper.find(params[:id])

    if !@favorite.save
      flash[:danger] = "不明なエラーです"
      redirect_to session[:previous_url]
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(deliverable_type: params[:type], deliverable_id: params[:id], user_id: current_user.id)
    @paper = Paper.find(params[:id])
    
    if !@favorite.destroy
      flash[:danger] = "不明なエラーです"
      redirect_to session[:previous_url]
    end
  end

end
