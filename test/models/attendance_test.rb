require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  def setup
    @training_execution = training_executions(:one)
    @employee = employees(:one)
  end

  test 'should not save attendance without employee' do
    attendance = Attendance.new(training_execution_id: @training_execution.id)
    assert_not attendance.save
  end

  test 'should not save attendance without training execution' do
    attendance = Attendance.new(employee_id: @employee.id)
    assert_not attendance.save
  end

  test 'should save attendance' do
    attendance = Attendance.new(employee_id: @employee.id,
                                training_execution_id: @training_execution.id)
    assert attendance.save
  end
end
