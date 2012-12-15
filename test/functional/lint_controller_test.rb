require 'test_helper'

class LintControllerTest < ActionController::TestCase
  test "routing" do
    assert_routing "/", :controller => "lint", :action => "index"
  end
  test "should get index" do
    get :index
    assert_response :success
  end
end
