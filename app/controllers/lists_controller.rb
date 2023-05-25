class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def set_params
    params.require(:list).permit(:name)
  end
end
