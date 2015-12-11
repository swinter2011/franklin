require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @week = Week.new(monday: 1, tuesday: 1, wednesday: 1, thursday: 1, friday: 1, saturday: 1,sunday: 1, virtue: "temperance", user_id: @user_id)
  end

  test "should be valid" do
    assert @week.valid?
  end

  test "user id should be present" do
    @weekt.user_id = nil
    assert_not @week.valid?
end
end
