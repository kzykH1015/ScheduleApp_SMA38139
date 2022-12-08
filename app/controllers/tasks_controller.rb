class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :move_sign_in

  def index
    @tasks = Task.all
    @user = User.find(current_user.id)
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

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private
  def task_params
    params.require(:task).permit(:task_title, :task_memo, :task_time)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def move_sign_in
    redirect_to  new_user_registration_path unless user_signed_in?
  end

end
