class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_memo, :task_time)
  end
end
