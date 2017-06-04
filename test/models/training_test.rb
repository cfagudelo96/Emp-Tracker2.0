require 'test_helper'

class TrainingTest < ActiveSupport::TestCase
  def setup
    @area = areas(:one)
    @company = companies(:one)
    @employee = employees(:one)
  end

  test 'should not save training without category' do
    training = Training.new(topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training without topic' do
    training = Training.new(category: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training without date' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training with negative hourly_intensity' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: -1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training without trainer' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            area_id: @area.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training execution without area and collaborator' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should not save training execution with area and collaboraborator' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            collaborator_id: @employee.id,
                            company_id: @company.id)
    assert_not training.save
  end

  test 'should save training' do
    training = Training.new(category: 'Test',
                            topic: 'Test',
                            objective: 'Test',
                            date: Time.now,
                            hourly_intensity: 1.5,
                            trainer: 'Test',
                            area_id: @area.id,
                            company_id: @company.id)
    assert training.save
  end
end
