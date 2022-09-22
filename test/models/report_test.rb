# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:report_of_alice)

    alice = users(:alice)
    assert report.editable?(alice)

    bob = users(:bob)
    assert_not report.editable?(bob)
  end

  test 'created_on' do
    report = reports(:report_of_alice)
    assert_instance_of Date, report.created_on
    assert_equal Time.zone.today, report.created_on
  end
end
