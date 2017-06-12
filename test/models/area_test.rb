require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  test 'should not save area without name' do
    area = Area.new
    assert_not area.save
  end

  test 'should not save area without unique name' do
    Area.new(name: 'Test').save
    area = Area.new(name: 'Test')
    assert_not area.save
  end

  test 'should save area' do
    area = Area.new(name: 'Test')
    assert area.save
  end

  test 'should filter by name' do
    areas = Area.by_name('MyString2')
    assert_equal 1, areas.size
  end
end
