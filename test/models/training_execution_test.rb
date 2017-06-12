require 'test_helper'

class TrainingExecutionTest < ActiveSupport::TestCase
  def setup
    @area = areas(:one)
    @company = companies(:one)
    @employee = employees(:one)
  end

  test 'should not save training execution without category' do
    training_execution = TrainingExecution.new(topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution without topic' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution without date' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution with negative hourly_intensity' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: -1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution without trainer' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution without area and collaborator' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should not save training execution with area and collaboraborator' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               collaborator_id: @employee.id,
                                               company_id: @company.id)
    assert_not training_execution.save
  end

  test 'should save training execution' do
    training_execution = TrainingExecution.new(category: 'Test',
                                               topic: 'Test',
                                               objective: 'Test',
                                               date: Time.now,
                                               hourly_intensity: 1.5,
                                               trainer: 'Test',
                                               area_id: @area.id,
                                               company_id: @company.id)
    assert training_execution.save
  end

  test 'should filter training executions by categories' do
    training_executions = TrainingExecution.by_category('MyString2')
    assert_equal 1, training_executions.size
  end

  test 'should filter training executions by topic' do
    training_executions = TrainingExecution.by_topic('MyString2')
    assert_equal 1, training_executions.size
  end

  test 'should filter training executions by date' do
    initial_date = Time.new(2017, 4, 6)
    final_date = Time.new(2017, 4, 8)
    training_executions = TrainingExecution.by_date(initial_date, final_date)
    assert_equal 1, training_executions.size
  end

  test 'should filter training executions by area' do
    training_executions = TrainingExecution.by_area(1)
    assert_equal 1, training_executions.size
  end

  test 'should filter training executions by collaborator' do
    training_executions = TrainingExecution.by_collaborator('MyString')
    assert_equal 1, training_executions.size
  end

  test 'should filter training executions by companies' do
    training_executions = TrainingExecution.by_company(1)
    assert_equal 1, training_executions.size
  end

  test 'should filter planned training executions' do
    training_executions = TrainingExecution.planned
    assert_equal 1, training_executions.size
  end
end
