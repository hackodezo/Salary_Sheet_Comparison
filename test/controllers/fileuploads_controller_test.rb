require 'test_helper'

class FileuploadsControllerTest < ActionController::TestCase
  setup do
    @fileupload = fileuploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fileuploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fileupload" do
    assert_difference('Fileupload.count') do
      post :create, fileupload: { end: @fileupload.end, file_name: @fileupload.file_name, last_row: @fileupload.last_row, project_name: @fileupload.project_name, start: @fileupload.start, unique: @fileupload.unique }
    end

    assert_redirected_to fileupload_path(assigns(:fileupload))
  end

  test "should show fileupload" do
    get :show, id: @fileupload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fileupload
    assert_response :success
  end

  test "should update fileupload" do
    patch :update, id: @fileupload, fileupload: { end: @fileupload.end, file_name: @fileupload.file_name, last_row: @fileupload.last_row, project_name: @fileupload.project_name, start: @fileupload.start, unique: @fileupload.unique }
    assert_redirected_to fileupload_path(assigns(:fileupload))
  end

  test "should destroy fileupload" do
    assert_difference('Fileupload.count', -1) do
      delete :destroy, id: @fileupload
    end

    assert_redirected_to fileuploads_path
  end
end
