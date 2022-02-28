require "application_system_test_case"

class TwodosTest < ApplicationSystemTestCase
  setup do
    @twodo = twodos(:one)
  end

  test "visiting the index" do
    visit twodos_url
    assert_selector "h1", text: "Twodos"
  end

  test "should create twodo" do
    visit twodos_url
    click_on "New twodo"

    fill_in "Name", with: @twodo.name
    fill_in "Status", with: @twodo.status
    click_on "Create Twodo"

    assert_text "Twodo was successfully created"
    click_on "Back"
  end

  test "should update Twodo" do
    visit twodo_url(@twodo)
    click_on "Edit this twodo", match: :first

    fill_in "Name", with: @twodo.name
    fill_in "Status", with: @twodo.status
    click_on "Update Twodo"

    assert_text "Twodo was successfully updated"
    click_on "Back"
  end

  test "should destroy Twodo" do
    visit twodo_url(@twodo)
    click_on "Destroy this twodo", match: :first

    assert_text "Twodo was successfully destroyed"
  end
end
