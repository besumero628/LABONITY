class Public::AlbumsController < ApplicationController
  before_action :set_laboratory
  before_action lambda {
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: %i[new edit]

  def index
    @albums = Album.where(laboratory_id: @set_laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    # render plain: params.inspect
    @album = Album.new(album_params)

    if @album.save
      flash[:info] = 'アルバムを新規登録しました！'
      redirect_to public_laboratory_albums_path(@set_laboratory.id)
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      flash[:info] = 'アルバムを編集しました！'
      redirect_to public_laboratory_albums_path(@set_laboratory.id)
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])

    if @album.destroy
      flash[:info] = 'アルバムを削除しました！'
      redirect_to public_laboratory_albums_path(@set_laboratory.id)
    else
      flash[:danger] = 'エラーです。'
      render 'index'
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :introduction, :laboratory_id, images: [])
  end
end
