require 'test_helper'

class AdditionalPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get rule" do
    get additional_pages_rule_url
    assert_response :success
  end

end
