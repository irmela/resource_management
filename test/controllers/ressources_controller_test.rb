require 'test_helper'

class RessourcesControllerTest < ActionController::TestCase
  setup do
    @ressource = ressources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ressources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ressource" do
    assert_difference('Ressource.count') do
      post :create, ressource: { department: @ressource.department, name: @ressource.name }
    end

    assert_redirected_to ressource_path(assigns(:ressource))
  end

  test "should show ressource" do
    get :show, id: @ressource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ressource
    assert_response :success
  end

  test "should update ressource" do
    patch :update, id: @ressource, ressource: { department: @ressource.department, name: @ressource.name }
    assert_redirected_to ressource_path(assigns(:ressource))
  end

  test "should destroy ressource" do
    assert_difference('Ressource.count', -1) do
      delete :destroy, id: @ressource
    end

    assert_redirected_to ressources_path
  end
end
