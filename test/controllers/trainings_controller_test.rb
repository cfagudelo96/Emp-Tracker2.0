require 'test_helper'

class TrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training = trainings(:one)
    @area = areas(:one)
    @collaborator = employees(:one)
    @company = companies(:one)
  end

  test 'should get index' do
    get trainings_url
    assert_response :success
  end

  test 'should get all' do
    get all_trainings_path
    assert_response :success
  end

  test 'should get new' do
    get new_training_url
    assert_response :success
  end

  test 'should create training' do
    assert_difference('Training.count') do
      post trainings_url, params: { training: { category: @training.category, topic: @training.topic, objective: @training.objective, date: @training.date, hourly_intensity: @training.hourly_intensity, company_id: @company.id, internal: @training.internal, trainer: @training.trainer, area_id: @area.id } }
    end

    assert_redirected_to training_url(Training.last)
  end

  test 'should show training' do
    get training_url(@training)
    assert_response :success
  end

  test 'should get edit' do
    get edit_training_url(@training)
    assert_response :success
  end

  test 'should update training' do
    patch training_url(@training), params: { training: { category: @training.category, topic: @training.topic, objective: @training.objective, date: @training.date, hourly_intensity: @training.hourly_intensity, company_id: @company.id, internal: @training.internal, trainer: @training.trainer, area_id: @area.id } }
    assert_redirected_to training_url(@training)
  end

  test 'should destroy training' do
    assert_difference('Training.count', -1) do
      delete training_url(@training)
    end

    assert_redirected_to trainings_url
  end
end
