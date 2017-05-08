require 'test_helper'

class TrainingExecutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_execution = training_executions(:one)
  end

  test "should get index" do
    get training_executions_url
    assert_response :success
  end

  test "should get new" do
    get new_training_execution_url
    assert_response :success
  end

  test "should create training_execution" do
    assert_difference('TrainingExecution.count') do
      post training_executions_url, params: { training_execution: { area_id: @training_execution.area_id, category: @training_execution.category, collaborator_id: @training_execution.collaborator_id, company_id: @training_execution.company_id, date: @training_execution.date, hourly_intensity: @training_execution.hourly_intensity, internal: @training_execution.internal, objective: @training_execution.objective, planned: @training_execution.planned, planned_training_id: @training_execution.planned_training_id, topic: @training_execution.topic, trainer: @training_execution.trainer } }
    end

    assert_redirected_to training_execution_url(TrainingExecution.last)
  end

  test "should show training_execution" do
    get training_execution_url(@training_execution)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_execution_url(@training_execution)
    assert_response :success
  end

  test "should update training_execution" do
    patch training_execution_url(@training_execution), params: { training_execution: { area_id: @training_execution.area_id, category: @training_execution.category, collaborator_id: @training_execution.collaborator_id, company_id: @training_execution.company_id, date: @training_execution.date, hourly_intensity: @training_execution.hourly_intensity, internal: @training_execution.internal, objective: @training_execution.objective, planned: @training_execution.planned, planned_training_id: @training_execution.planned_training_id, topic: @training_execution.topic, trainer: @training_execution.trainer } }
    assert_redirected_to training_execution_url(@training_execution)
  end

  test "should destroy training_execution" do
    assert_difference('TrainingExecution.count', -1) do
      delete training_execution_url(@training_execution)
    end

    assert_redirected_to training_executions_url
  end
end
