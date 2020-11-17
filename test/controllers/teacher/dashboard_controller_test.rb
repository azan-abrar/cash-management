# frozen_string_literal: true

require 'test_helper'

class Teacher::DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get teacher_dashboard_index_url
    assert_response :success
  end
end
