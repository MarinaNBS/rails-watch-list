class ListsController < ApplicationController
  # before_action :set_list, only: %i[new create update]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @bookmark.lists = @list
    if @bookmark.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)

    redirect_to lists_path(@list)
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@bookmark.lists), status: :see_other
  end

  private
  # def set_restaurant
  #   @list = List.find(params[:id])
  # end

  def list_params
    params.require(:list).permit(:name)
  end
end
