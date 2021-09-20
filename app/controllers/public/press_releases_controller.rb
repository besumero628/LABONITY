class Public::PressReleasesController < ApplicationController
  before_action :set_laboratory, only: [:show]

  def show
    @press_release = PressRelease.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def press_releases_params
    params.require(:press_releases).permit(:title, :body)
  end

  def set_laboratory
    if params[:laboratory_id]
      @set_laboratory = Laboratory.find(params[:laboratory_id])
    elsif params[:id]
      @set_laboratory = Laboratory.find(params[:id])
    end
  end

end
