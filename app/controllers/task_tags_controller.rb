class TaskTagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_tag, only: %i[ show edit update destroy ]

  # GET /task_tags or /task_tags.json
  def index
    @task_tags = TaskTag.all
  end

  # GET /task_tags/1 or /task_tags/1.json
  def show
  end

  # GET /task_tags/new
  def new
    @task_tag = TaskTag.new
  end

  # GET /task_tags/1/edit
  def edit
  end

  # POST /task_tags or /task_tags.json
  def create
    @task_tag = TaskTag.new(task_tag_params)

    respond_to do |format|
      if @task_tag.save
        format.html { redirect_to @task_tag, notice: "Task tag was successfully created." }
        format.json { render :show, status: :created, location: @task_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_tags/1 or /task_tags/1.json
  def update
    respond_to do |format|
      if @task_tag.update(task_tag_params)
        format.html { redirect_to @task_tag, notice: "Task tag was successfully updated." }
        format.json { render :show, status: :ok, location: @task_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_tags/1 or /task_tags/1.json
  def destroy
    @task_tag.destroy!

    respond_to do |format|
      format.html { redirect_to task_tags_path, status: :see_other, notice: "Task tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_tag
      @task_tag = TaskTag.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_tag_params
      params.expect(task_tag: [ :name, :color ])
    end
end
