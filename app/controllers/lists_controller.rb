class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update,]
  before_action :set_board


  def index
    @lists = board.list
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @board = current_user.board.find(params[:board_id])
    end

    def set_list
      @list = current_user.lists.find(params[:id])
    end
end
