require 'test_helper'

class CombatantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @combatant = combatants(:one)
  end

  test "should get index" do
    get combatants_url
    assert_response :success
  end

  test "should get new" do
    get new_combatant_url
    assert_response :success
  end

  test "should create combatant" do
    assert_difference('Combatant.count') do
      post combatants_url, params: { combatant: {  } }
    end

    assert_redirected_to combatant_url(Combatant.last)
  end

  test "should show combatant" do
    get combatant_url(@combatant)
    assert_response :success
  end

  test "should get edit" do
    get edit_combatant_url(@combatant)
    assert_response :success
  end

  test "should update combatant" do
    patch combatant_url(@combatant), params: { combatant: {  } }
    assert_redirected_to combatant_url(@combatant)
  end

  test "should destroy combatant" do
    assert_difference('Combatant.count', -1) do
      delete combatant_url(@combatant)
    end

    assert_redirected_to combatants_url
  end
end
