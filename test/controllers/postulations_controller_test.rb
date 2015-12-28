require 'test_helper'

class PostulationsControllerTest < ActionController::TestCase
  setup do
    @postulation = postulations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulation" do
    assert_difference('Postulation.count') do
      post :create, postulation: { address: @postulation.address, birthdate: @postulation.birthdate, birthplace: @postulation.birthplace, city: @postulation.city, commune: @postulation.commune, degree: @postulation.degree, degree_country: @postulation.degree_country, degree_school: @postulation.degree_school, degree_year: @postulation.degree_year, email: @postulation.email, financing_id: @postulation.financing_id, find_out_id: @postulation.find_out_id, message_phone: @postulation.message_phone, mobile_phone: @postulation.mobile_phone, name: @postulation.name, nationality: @postulation.nationality, observations: @postulation.observations, occupation: @postulation.occupation, other_degree: @postulation.other_degree, other_degree_country: @postulation.other_degree_country, other_degree_year: @postulation.other_degree_year, phone: @postulation.phone, program_id: @postulation.program_id, rut: @postulation.rut, second_surname: @postulation.second_surname, surname: @postulation.surname, work_address: @postulation.work_address, work_city: @postulation.work_city, work_commune: @postulation.work_commune, work_email: @postulation.work_email, work_phone: @postulation.work_phone }
    end

    assert_redirected_to postulation_path(assigns(:postulation))
  end

  test "should show postulation" do
    get :show, id: @postulation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulation
    assert_response :success
  end

  test "should update postulation" do
    patch :update, id: @postulation, postulation: { address: @postulation.address, birthdate: @postulation.birthdate, birthplace: @postulation.birthplace, city: @postulation.city, commune: @postulation.commune, degree: @postulation.degree, degree_country: @postulation.degree_country, degree_school: @postulation.degree_school, degree_year: @postulation.degree_year, email: @postulation.email, financing_id: @postulation.financing_id, find_out_id: @postulation.find_out_id, message_phone: @postulation.message_phone, mobile_phone: @postulation.mobile_phone, name: @postulation.name, nationality: @postulation.nationality, observations: @postulation.observations, occupation: @postulation.occupation, other_degree: @postulation.other_degree, other_degree_country: @postulation.other_degree_country, other_degree_year: @postulation.other_degree_year, phone: @postulation.phone, program_id: @postulation.program_id, rut: @postulation.rut, second_surname: @postulation.second_surname, surname: @postulation.surname, work_address: @postulation.work_address, work_city: @postulation.work_city, work_commune: @postulation.work_commune, work_email: @postulation.work_email, work_phone: @postulation.work_phone }
    assert_redirected_to postulation_path(assigns(:postulation))
  end

  test "should destroy postulation" do
    assert_difference('Postulation.count', -1) do
      delete :destroy, id: @postulation
    end

    assert_redirected_to postulations_path
  end
end
