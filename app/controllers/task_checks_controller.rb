class TaskChecksController < ApplicationController
  before_action :set_task_check, only: %i[ show edit update destroy ]

  # GET /task_checks or /task_checks.json
  def index
    @task_checks = TaskCheck.all
  end

  # GET /task_checks/1 or /task_checks/1.json
  def show
  end

  # GET /task_checks/new
  def new
    @task_check = TaskCheck.new
  end

  # GET /task_checks/1/edit
  def edit
  end

  # POST /task_checks or /task_checks.json
  def create
    @task_check = TaskCheck.new(task_check_params)

    respond_to do |format|
      if @task_check.save
        format.html { redirect_to @task_check, notice: "Task check was successfully created." }
        format.json { render :show, status: :created, location: @task_check }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_checks/1 or /task_checks/1.json
  def update
    respond_to do |format|
      if @task_check.update(task_check_params)
        format.html { redirect_to @task_check, notice: "Task check was successfully updated." }
        format.json { render :show, status: :ok, location: @task_check }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_checks/1 or /task_checks/1.json
  def destroy
    @task_check.destroy!

    respond_to do |format|
      format.html { redirect_to task_checks_path, status: :see_other, notice: "Task check was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_check
      @task_check = TaskCheck.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_check_params
      params.expect(task_check: [ :description, :complete ])
    end
end
