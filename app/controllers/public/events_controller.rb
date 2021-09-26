class Public::EventsController < ApplicationController
  before_action :set_company
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def edit
    @event = Event.find(params[:id])    
  end
  
  def create
    @event = Event.new(event_params)
    
    if @event.save
      flash[:info] = "Eventを新規登録しました！"
      redirect_to public_company_path(@set_company.id)
    else
      flash[:danger] = "エラーです"
      render "new"
    end
  end
  
  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      flash[:info] = "イベントを編集しました！"
      redirect_to public_company_path(@set_company.id)
    else
      render "edit"
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :body, :link_path, :company_id)
  end
  
end
