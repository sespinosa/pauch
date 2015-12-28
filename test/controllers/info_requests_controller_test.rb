require 'test_helper'

class InfoRequestsControllerTest < ActionController::TestCase
  setup do
    @info_request = info_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_request" do
    assert_difference('InfoRequest.count') do
      post :create, info_request: { find_out_id: @info_request.find_out_id, name: @info_request.name, observations: @info_request.observations, program_id: @info_request.program_id, rut: @info_request.rut, second_surname: @info_request.second_surname, surname: @info_request.surname }
    end

    assert_redirected_to info_request_path(assigns(:info_request))
  end

  test "should show info_request" do
    get :show, id: @info_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_request
    assert_response :success
  end

  test "should update info_request" do
    patch :update, id: @info_request, info_request: { find_out_id: @info_request.find_out_id, name: @info_request.name, observations: @info_request.observations, program_id: @info_request.program_id, rut: @info_request.rut, second_surname: @info_request.second_surname, surname: @info_request.surname }
    assert_redirected_to info_request_path(assigns(:info_request))
  end

  test "should destroy info_request" do
    assert_difference('InfoRequest.count', -1) do
      delete :destroy, id: @info_request
    end

    assert_redirected_to info_requests_path
  end
end
