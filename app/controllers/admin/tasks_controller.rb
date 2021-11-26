class Admin::TasksController < Admin::BaseController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Saved Task"
      redirect_to admin_tasks_path
    else
      flash[:alert] = @task.errors.full_messages.join("\n")
      render :new
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
