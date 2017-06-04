require 'test_helper'

class TrainingExecutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_execution = training_executions(:one)
    @area = areas(:one)
    @collaborator = employees(:one)
    @company = companies(:one)
  end

  test 'should get index' do
    get training_executions_url
    assert_response :success
  end

  test 'should get new' do
    get new_training_execution_url
    assert_response :success
  end

  test 'should create training_execution' do
    assert_difference('TrainingExecution.count') do
      post training_executions_url, params: { training_execution: { category: @training_execution.category, topic: @training_execution.topic, objective: @training_execution.objective, date: @training_execution.date, hourly_intensity: @training_execution.hourly_intensity, company_id: @company.id, internal: @training_execution.internal, trainer: @training_execution.trainer, area_id: @area.id } }
    end

    assert_redirected_to training_execution_url(TrainingExecution.last)
  end

  test 'should show training_execution' do
    get training_execution_url(@training_execution)
    assert_response :success
  end

  test 'should get edit' do
    get edit_training_execution_url(@training_execution)
    assert_response :success
  end

  test 'should update training_execution' do
    patch training_execution_url(@training_execution), params: { training_execution: { category: @training_execution.category, topic: @training_execution.topic, objective: @training_execution.objective, date: @training_execution.date, hourly_intensity: @training_execution.hourly_intensity, company_id: @company.id, internal: @training_execution.internal, trainer: @training_execution.trainer, area_id: @area.id } }
    assert_redirected_to training_execution_url(@training_execution)
  end

  test 'should destroy training_execution' do
    assert_difference('TrainingExecution.count', -1) do
      delete training_execution_url(@training_execution)
    end

    assert_redirected_to training_executions_url
  end

  test 'shoul get register_attendances' do
    get register_attendances_training_execution_url(@training_execution)
    assert_response :success
  end

  test 'should save attendances' do
    patch save_attendances_training_execution_url(@training_execution), params: { employees_id: [employees(:one).id, employees(:two).id] }
    assert_redirected_to training_execution_url(@training_execution)
  end
end
