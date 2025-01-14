class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task_list
  before_action :set_priorities, only: %i[ create new edit update]
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = @task_list.tasks.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @task_list.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @task_list.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_list_tasks_path(@task_list, @task), notice: "Task was successfully created." }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.remove("modal"),
            turbo_stream.append("board", partial: "task_lists/task_table_preview", locals: { task: @task })
          ]
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_list_path(@task_list, @task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to task_list_tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
      format.turbo_stream {
          render turbo_stream: [
            turbo_stream.remove("modal"),
            turbo_stream.remove("task_#{@task.id}")
          ]
        }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_task_list
      @task_list = TaskList.find(params[:task_list_id])
    end

    def set_priorities
      @priorities = [ [ "Alta", 3 ], [ "Média", 2 ], [ "Baixa", 1 ] ]
    end

    def set_task
      @task = Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.expect(task: [ :name, :description, :priority, :due_date, :status ])
    end
end
