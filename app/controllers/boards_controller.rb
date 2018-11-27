class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update,]

  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
  end

  def edit
  end

  def update
    if  @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board.destroy 
    redirect_to boards_path
  end

  private
    def board_params
      params.require (:board).permit(:name)
    end

    def set_board
      @board = current_user.boards.find(params[:id])
    end
end