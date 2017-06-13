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

  test 'should filter employees by name' do
    employees = Employee.by_name('MyString2')
    assert_equal 1, employees.size
  end

  test 'should filter employees by identification' do
    employees = Employee.by_identification(2)
    assert_equal 1, employees.size
  end

  test 'should filter employees by position' do
    employees = Employee.by_position('MyString2')
    assert_equal 1, employees.size
  end

  test 'should filter employees by area' do
    employees = Employee.by_area(1)
    assert_equal 1, employees.size
  end

  test 'should filter employees by company' do
    employees = Employee.by_company(1)
    assert_equal 1, employees.size
  end

  test 'should filter active employees' do
    employees = Employee.active
    assert_equal 1, employees.size
  end

  test 'should filter employees by admission date' do
    initial_date = Time.new(2017, 4, 6)
    final_date = Time.new(2017, 4, 8)
    employees = Employee.by_admission_date(initial_date, final_date)
    assert_equal 1, employees.size
  end

  test 'should filter employees without trainings' do
    employees = Employee.without_trainings
    assert_equal 1, employees.size
  end

  test 'should filter employees without trainings between dates' do
    initial_date = Time.new(2016, 4, 6)
    final_date = Time.new(2018, 4, 8)
    employees = Employee.without_trainings_between_dates(initial_date, final_date)
    assert_equal 1, employees.size

    initial_date = Time.new(2015, 4, 6)
    final_date = Time.new(2016, 4, 8)
    employees = Employee.without_trainings_between_dates(initial_date, final_date)
    assert_equal 2, employees.size
  end
end
