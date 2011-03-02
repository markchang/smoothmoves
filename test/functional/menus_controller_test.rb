require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Menu.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Menu.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Menu.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to menu_url(assigns(:menu))
  end

  def test_edit
    get :edit, :id => Menu.first
    assert_template 'edit'
  end

  def test_update_invalid
    Menu.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Menu.first
    assert_template 'edit'
  end

  def test_update_valid
    Menu.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Menu.first
    assert_redirected_to menu_url(assigns(:menu))
  end

  def test_destroy
    menu = Menu.first
    delete :destroy, :id => menu
    assert_redirected_to menus_url
    assert !Menu.exists?(menu.id)
  end
end
