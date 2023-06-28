require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference("Player.count") do
      post players_url, params: { player: { cellphone_number: @player.cellphone_number, did_highschool: @player.did_highschool, fullname: @player.fullname, has_id: @player.has_id, medical_aid: @player.medical_aid, medical_conditions: @player.medical_conditions, nickname: @player.nickname, player_position: @player.player_position } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { cellphone_number: @player.cellphone_number, did_highschool: @player.did_highschool, fullname: @player.fullname, has_id: @player.has_id, medical_aid: @player.medical_aid, medical_conditions: @player.medical_conditions, nickname: @player.nickname, player_position: @player.player_position } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference("Player.count", -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
