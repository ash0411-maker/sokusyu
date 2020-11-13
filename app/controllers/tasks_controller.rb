class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を登録しました！"
      # redirect_to tasks_path
      # flsah[:notice] = "#{@task.name}を登録しました！"
    else
      render :new
    end
  end

  def destroy
    task = Task.find(params[:id]).destroy
    redirect_to tasks_path, notice: "タスク「#{task.name}を削除しました。」"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
