require File.dirname(__FILE__) + '/../test_helper'
require 'session_controller'

# Re-raise errors caught by the controller.
class SessionController; def rescue_action(e) raise e end; end

class SessionControllerTest < Test::Unit::TestCase
  fixtures :users
  def setup
    @controller = SessionController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_show
    get :show
    assert_bounced
  end
  def test_index
    get :index
    assert_bounced
  end

  def test_new
    get :new
    assert_response :success
    assert_template 'new'
    assert_nil session[:uid]
  end

  def test_create
    post :create, :password=>'standard', :login=>users(:bob).login
    assert_response :redirect
    assert_redirected_to :controller=>'welcome', :action=>'index'
    assert_equal session[:uid], users(:bob).id
  end

  def test_destroy
    delete :destroy
    assert_response :redirect
    assert_redirected_to :controller=>'welcome', :action=>'index'
    assert_nil session[:uid]
    assert_equal "Logged Out", flash[:info]
  end
end
