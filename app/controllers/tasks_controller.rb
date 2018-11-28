class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end
end
