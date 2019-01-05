require "application_system_test_case"

class CombatantsTest < ApplicationSystemTestCase
  setup do
    @combatant = combatants(:one)
  end

  test "visiting the index" do
    visit combatants_url
    assert_selector "h1", text: "Combatants"
  end

  test "creating a Combatant" do
    visit combatants_url
    click_on "New Combatant"

    click_on "Create Combatant"

    assert_text "Combatant was successfully created"
    click_on "Back"
  end

  test "updating a Combatant" do
    visit combatants_url
    click_on "Edit", match: :first

    click_on "Update Combatant"

    assert_text "Combatant was successfully updated"
    click_on "Back"
  end

  test "destroying a Combatant" do
    visit combatants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Combatant was successfully destroyed"
  end
end
