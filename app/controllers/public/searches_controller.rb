class Public::SearchesController < ApplicationController
  

  def index
    model = {"laboratory" => Laboratory.all,
              "company" => Company.all,
              "paper" => Paper.all,
              "confernce" => Confernce.all,
              "book" => Book.all,
              "event" => Event.all
    }
    
    @search = model[params[:model]].search(params[:q])
    @search_results = @search.result.page(params[:page]).per(3)
  end

end
