require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: @users.name if @user.name
    assert_response :success
    assert_template 'profiles/show'
  end

end
