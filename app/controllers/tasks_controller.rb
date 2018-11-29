class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list


  def index
    @tasks = @list.tasks
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render partial: "form"
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to [@list, @task]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to [@list, @task]
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end

    def set_task
      @task = list.task.find(params[:id])
    end

    def set_list
      @list = current_user.lists.find(params[:list_id])
    end
end
