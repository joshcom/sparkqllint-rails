require 'test_helper'

class LintControllerTest < ActionController::TestCase
  test "routing" do
    assert_routing "/", :controller => "lint", :action => "index"
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "valid filter should set flash :notice" do
    get :index, :_filter => "City Eq 'Fargo'"
    assert_response :success
    assert !flash[:error]
    assert flash[:notice]
  end

  test "invalid filter should set flash :error" do
    get :index, :_filter => "City Eq 'Fargo' And"
    assert_response :success
    assert flash[:error]
    assert !flash[:notice]
  end
end
