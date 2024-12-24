require "test_helper"

class TaskChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_check = task_checks(:one)
  end

  test "should get index" do
    get task_checks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_check_url
    assert_response :success
  end

  test "should create task_check" do
    assert_difference("TaskCheck.count") do
      post task_checks_url, params: { task_check: { complete: @task_check.complete, description: @task_check.description } }
    end

    assert_redirected_to task_check_url(TaskCheck.last)
  end

  test "should show task_check" do
    get task_check_url(@task_check)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_check_url(@task_check)
    assert_response :success
  end

  test "should update task_check" do
    patch task_check_url(@task_check), params: { task_check: { complete: @task_check.complete, description: @task_check.description } }
    assert_redirected_to task_check_url(@task_check)
  end

  test "should destroy task_check" do
    assert_difference("TaskCheck.count", -1) do
      delete task_check_url(@task_check)
    end

    assert_redirected_to task_checks_url
  end
end
