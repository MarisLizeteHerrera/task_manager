class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_board


  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = @board.lists.new
    render partial: "form"
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to [@board, @list]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @list = Board.list.find(params[:id])
    end

    def set_board
      @board = current_user.boards.find(params[:board_id])
    end
end
