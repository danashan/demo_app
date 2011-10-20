require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Topic.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Topic.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_edit
    get :edit, :id => Topic.first
    assert_template 'edit'
  end

  def test_update_invalid
    Topic.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Topic.first
    assert_template 'edit'
  end

  def test_update_valid
    Topic.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Topic.first
    assert_redirected_to root_url
  end

  def test_destroy
    topic = Topic.first
    delete :destroy, :id => topic
    assert_redirected_to root_url
    assert !Topic.exists?(topic.id)
  end
end
