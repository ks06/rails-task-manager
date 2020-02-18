class TasksController < ApplicationController
  before_action :set_task, except: %i[index new]

  def index
    @tasks = Task.all
  end

  def show
    @completed = completed?
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def completed?
    @task.completed ? 'This task has been completed.' : 'This task is not completed yet.'
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
