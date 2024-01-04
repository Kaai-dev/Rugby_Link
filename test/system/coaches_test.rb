require "application_system_test_case"

class CoachesTest < ApplicationSystemTestCase
  setup do
    @coach = coaches(:one)
  end

  test "visiting the index" do
    visit coaches_url
    assert_selector "h1", text: "Coaches"
  end

  test "should create coach" do
    visit coaches_url
    click_on "New coach"

    fill_in "Cellphone number", with: @coach.cellphone_number
    fill_in "Id number", with: @coach.id_number
    fill_in "Medical aid", with: @coach.medical_aid
    fill_in "Medical condition", with: @coach.medical_condition
    fill_in "Name", with: @coach.name
    click_on "Create Coach"

    assert_text "Coach was successfully created"
    click_on "Back"
  end

  test "should update Coach" do
    visit coach_url(@coach)
    click_on "Edit this coach", match: :first

    fill_in "Cellphone number", with: @coach.cellphone_number
    fill_in "Id number", with: @coach.id_number
    fill_in "Medical aid", with: @coach.medical_aid
    fill_in "Medical condition", with: @coach.medical_condition
    fill_in "Name", with: @coach.name
    click_on "Update Coach"

    assert_text "Coach was successfully updated"
    click_on "Back"
  end

  test "should destroy Coach" do
    visit coach_url(@coach)
    click_on "Destroy this coach", match: :first

    assert_text "Coach was successfully destroyed"
  end
end
