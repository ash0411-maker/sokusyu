class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new(task_params)
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)

    if params[:back].present?
      render :new
      return
    end

    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を登録しました！"
      # redirect_to tasks_path
      # flsah[:notice] = "#{@task.name}を登録しました！"
    else
      render :new
    end
  end

  def destroy
    redirect_to tasks_path, notice: "タスク「#{@task.name}を削除しました。」"
  end

  def new_confirm
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
