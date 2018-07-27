require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workers_index_url
    assert_response :success
  end

end
