require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @area = areas(:one)
    @company = companies(:one)
    @employee = employees(:one)
  end

  test 'should not save employee without name' do
    employee = Employee.new(identification: 1,
                            area_id: @area.id,
                            admission_date: Time.now,
                            position: 'Test',
                            company_id: @company.id)
    assert_not employee.save
  end

  test 'should not save employee without unique identification' do
    employee = Employee.new(name: 'Test',
                            identification: employees(:one).identification,
                            area_id: @area.id,
                            admission_date: Time.now,
                            position: 'Test',
                            company_id: @company.id)
    assert_not employee.save
  end

  test 'should not save employee with negative identification' do
    employee = Employee.new(name: 'Test',
                            identification: -1,
                            area_id: @area.id,
                            admission_date: Time.now,
                            position: 'Test',
                            company_id: @company.id)
    assert_not employee.save
  end

  test 'should not save employee without admission date' do
    employee = Employee.new(name: 'Test',
                            identification: 1,
                            area_id: @area.id,
                            position: 'Test',
                            company_id: @company.id)
    assert_not employee.save
  end

  test 'should save employee' do
    employee = Employee.new(name: 'Test',
                            identification: 1,
                            area_id: @area.id,
                            admission_date: Time.now,
                            position: 'Test',
                            company_id: @company.id)
    assert employee.save
  end
end
