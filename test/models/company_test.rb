require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'should not save company without name' do
    company = Company.new
    assert_not company.save
  end

  test 'should not save company without unique name' do
    Company.new(name: 'Test').save
    company = Company.new(name: 'Test')
    assert_not company.save
  end

  test 'should company company' do
    company = Company.new(name: 'Test')
    assert company.save
  end

  test 'should filter by name' do
    companies = Company.by_name('MyString2')
    assert_equal 1, companies.size
  end
end
