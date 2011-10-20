require 'test_helper'

class ForumsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Forum.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Forum.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_edit
    get :edit, :id => Forum.first
    assert_template 'edit'
  end

  def test_update_invalid
    Forum.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Forum.first
    assert_template 'edit'
  end

  def test_update_valid
    Forum.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Forum.first
    assert_redirected_to root_url
  end

  def test_destroy
    forum = Forum.first
    delete :destroy, :id => forum
    assert_redirected_to root_url
    assert !Forum.exists?(forum.id)
  end
end
