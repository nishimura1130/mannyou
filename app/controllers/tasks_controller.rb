# class TasksController < ApplicationController
#   def index
#     @tasks = Task.all
#   end
#   def new
#     @task = Task.new
#   end
#   def create
#     @task = Task.new(task_params)
#     if params[:back]
#       render :new
#     else
#       if @task.save
#         redirect_to tasks_path, notice: "タスクを作成しました！"
#       else
#         render :new
#       end
#     end
#   end
#   def show
#     @task = Task.find(params[:id])   # 重複！
#   end
#   def confirm
#     @task = Task.new(task_params)
#     render :new if @task.invalid?
#   end
#   def edit
#     @task = Task.find(params[:id])   # 重複！
#   end
#   def update
#     @task = Task.find(params[:id])   # 重複！
#     if @task.update(task_params)
#       redirect_to tasks_path, notice: "タスクを編集しました！"
#     else
#       render :edit
#     end
#   end
#   def destroy
#     @task = Task.find(params[:id])  
#     @task.destroy
#     redirect_to tasks_path, notice:"タスクを削除しました！"
#   end
#   # def set_task
#   #   @task = Task.find(params[id])
#   # end
#   private
#   def task_params
#     params.require(:task).permit(:title, :content)
#   end
# end
class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'タスクを作成しました'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'タスクを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'タスクを削除しました'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      :content,
      :deadline,
      :status,
      :priority,
    )
  end

end