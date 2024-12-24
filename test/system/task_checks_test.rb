require "application_system_test_case"

class TaskChecksTest < ApplicationSystemTestCase
  setup do
    @task_check = task_checks(:one)
  end

  test "visiting the index" do
    visit task_checks_url
    assert_selector "h1", text: "Task checks"
  end

  test "should create task check" do
    visit task_checks_url
    click_on "New task check"

    check "Complete" if @task_check.complete
    fill_in "Description", with: @task_check.description
    click_on "Create Task check"

    assert_text "Task check was successfully created"
    click_on "Back"
  end

  test "should update Task check" do
    visit task_check_url(@task_check)
    click_on "Edit this task check", match: :first

    check "Complete" if @task_check.complete
    fill_in "Description", with: @task_check.description
    click_on "Update Task check"

    assert_text "Task check was successfully updated"
    click_on "Back"
  end

  test "should destroy Task check" do
    visit task_check_url(@task_check)
    click_on "Destroy this task check", match: :first

    assert_text "Task check was successfully destroyed"
  end
end
