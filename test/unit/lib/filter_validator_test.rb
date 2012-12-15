require 'test_helper'
require 'filter_validator'

class FilterValidatorTest < ActiveSupport::TestCase

  setup do
    @good_filter = "City Eq 'Fargo'"
  end

  test ".sanitize_incoming_filter" do
    assert_equal @good_filter,
      FilterValidator.sanitize_incoming_filter("  #{@good_filter}  ")
    assert_equal @good_filter,
      FilterValidator.sanitize_incoming_filter(@good_filter)
  end

  test "initialize filter validator" do
    assert_instance_of FilterValidator, FilterValidator.new(@good_filter)
  end

  test "nil filter is blank, as is filter with an empty string" do
    assert FilterValidator.new(nil).blank?
    assert FilterValidator.new("").blank?
    assert FilterValidator.new("   ").blank?
  end

  test "filter text is presserved, albeit sanitized" do
    v = FilterValidator.new(" #{@good_filter} ")
    assert_equal @good_filter, v.filter_text
  end

  test "parse works with a nil filter" do
    v = FilterValidator.new(nil)
    assert !v.errors?
  end

  test "#errors?" do
    assert !FilterValidator.new(@good_filter).errors?
    assert FilterValidator.new("City Is Fargo").errors?
  end

  test "#errors" do
    assert !FilterValidator.new(@good_filter).errors?
    assert FilterValidator.new("City Is Fargo").errors?
  end
end
