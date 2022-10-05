class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update soft_delete versions] 
  before_action :authenticate_user!

  def index
    @lists = List.all
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.task.new(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream { redirect_to root_url, notice: "Task was successfully created." }
        format.html { redirect_to root_url, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream { redirect_to root_url, notice: "Task was successfully updated." }
        format.html { redirect_to root_url, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def soft_delete
    @task.toggle!(:soft_deleted)
    respond_to do |format|
      format.turbo_stream { redirect_to root_url, notice: "Task was successfully deleted." }
      format.html { redirect_to root_url, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def versions
    @tasks_versions = @task.versions
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :title, :user_id, :list_id, :soft_delete, :priority)
  end
end
