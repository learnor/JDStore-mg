require 'test_helper'

class Account::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get account_profiles_show_url
    assert_response :success
  end

end
