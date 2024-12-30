class TaskListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_list, only: %i[ show edit update destroy ]

  # GET /task_lists or /task_lists.json
  def index
    @task_lists = current_user.task_lists
  end

  # GET /task_lists/1 or /task_lists/1.json
  def show
    @tasks = @task_list.tasks
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists or /task_lists.json
  def create
    @task_list = current_user.task_lists.build(task_list_params)
    # adding default statuses to every list
    @task_list.statuses.build([ { name: "TODO", color: "#008BF8" }, { name: "Andamento", color: "#F3CA40" }, { name: "Concluído", color: "#7CE577" } ])

    respond_to do |format|
      if @task_list.save
        format.html { redirect_to @task_list, notice: "Task list was successfully created." }
        format.json { render :show, status: :created, location: @task_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_lists/1 or /task_lists/1.json
  def update
    respond_to do |format|
      if @task_list.update(task_list_params)
        format.html { redirect_to @task_list, notice: "Task list was successfully updated." }
        format.json { render :show, status: :ok, location: @task_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1 or /task_lists/1.json
  def destroy
    @task_list.destroy!

    respond_to do |format|
      format.html { redirect_to task_lists_path, status: :see_other, notice: "Task list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_list_params
      # params.expect(task_list: [ :name, :description, tasks_attributes: [ [ :name, :description, :priority, :due_date, :_destroy ] ] ])
      params.require(:task_list).permit(:name, :description,
        tasks_attributes: [ :id, :name, :description, :priority, :due_date, :_destroy ])
    end
end
