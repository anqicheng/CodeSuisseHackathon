require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { name: @company.name, per_FY1: @company.per_FY1, per_FY2: @company.per_FY2, per_LFY: @company.per_LFY, pr01: @company.pr01, pr02: @company.pr02, pr03: @company.pr03, pr04: @company.pr04, pr13: @company.pr13, pr26: @company.pr26, pr39: @company.pr39, pr52: @company.pr52, pr_year_to_date: @company.pr_year_to_date, price_current: @company.price_current, symbol: @company.symbol, warranted_price: @company.warranted_price }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { name: @company.name, per_FY1: @company.per_FY1, per_FY2: @company.per_FY2, per_LFY: @company.per_LFY, pr01: @company.pr01, pr02: @company.pr02, pr03: @company.pr03, pr04: @company.pr04, pr13: @company.pr13, pr26: @company.pr26, pr39: @company.pr39, pr52: @company.pr52, pr_year_to_date: @company.pr_year_to_date, price_current: @company.price_current, symbol: @company.symbol, warranted_price: @company.warranted_price }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
