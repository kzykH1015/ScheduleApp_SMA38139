class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_memo, :task_time)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
