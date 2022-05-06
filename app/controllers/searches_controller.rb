class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      redirect_to search_result_path(@users)
    else
      @books = Book.looks(params[:search], params[:word])
      redirect_to search_result_path(@books)
    end
  end

  def search_result
    @users = User.all
    @books = Book.all
  end

end
