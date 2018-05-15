require 'test_helper'

class WelkomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welkome_index_url
    assert_response :success
  end

end
