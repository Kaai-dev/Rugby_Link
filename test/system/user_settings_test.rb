require "application_system_test_case"

class UserSettingsTest < ApplicationSystemTestCase
  setup do
    @user_setting = user_settings(:one)
  end

  test "visiting the index" do
    visit user_settings_url
    assert_selector "h1", text: "User settings"
  end

  test "should create user setting" do
    visit user_settings_url
    click_on "New user setting"

    check "Dark mode" if @user_setting.dark_mode
    fill_in "User", with: @user_setting.user_id
    click_on "Create User setting"

    assert_text "User setting was successfully created"
    click_on "Back"
  end

  test "should update User setting" do
    visit user_setting_url(@user_setting)
    click_on "Edit this user setting", match: :first

    check "Dark mode" if @user_setting.dark_mode
    fill_in "User", with: @user_setting.user_id
    click_on "Update User setting"

    assert_text "User setting was successfully updated"
    click_on "Back"
  end

  test "should destroy User setting" do
    visit user_setting_url(@user_setting)
    click_on "Destroy this user setting", match: :first

    assert_text "User setting was successfully destroyed"
  end
end
