require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a student" do
    assert_difference('Student.count') do
      post :create, student: { name: @student.name, 
                               email_address: @student.email_address }
    end

    assert_equal @response.code, "302"
    assert_not_nil @response.header["Location"]
  end

  test "should fail to create a student with invalid email" do
    assert_no_difference('Student.count') do
      post :create, student: { name: @student.name, 
                               email_address: "asdf" }
    end

    assert_equal @response.code, "200"
    assert_template "new"
  end
end
