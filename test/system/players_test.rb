require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit players_url
    click_on "New player"

    fill_in "Cellphone number", with: @player.cellphone_number
    check "Did highschool" if @player.did_highschool
    fill_in "Fullname", with: @player.fullname
    check "Has" if @player.has_id
    fill_in "Medical aid", with: @player.medical_aid
    fill_in "Medical conditions", with: @player.medical_conditions
    fill_in "Nickname", with: @player.nickname
    fill_in "Player position", with: @player.player_position
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "Cellphone number", with: @player.cellphone_number
    check "Did highschool" if @player.did_highschool
    fill_in "Fullname", with: @player.fullname
    check "Has" if @player.has_id
    fill_in "Medical aid", with: @player.medical_aid
    fill_in "Medical conditions", with: @player.medical_conditions
    fill_in "Nickname", with: @player.nickname
    fill_in "Player position", with: @player.player_position
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
