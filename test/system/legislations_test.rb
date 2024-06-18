require "application_system_test_case"

class LegislationsTest < ApplicationSystemTestCase
  setup do
    @legislation = legislations(:one)
  end

  test "visiting the index" do
    visit legislations_url
    assert_selector "h1", text: "Legislations"
  end

  test "should create legislation" do
    visit legislations_url
    click_on "New legislation"

    fill_in "Description", with: @legislation.description
    fill_in "Status", with: @legislation.status
    fill_in "Title", with: @legislation.title
    fill_in "User", with: @legislation.user_id
    click_on "Create Legislation"

    assert_text "Legislation was successfully created"
    click_on "Back"
  end

  test "should update Legislation" do
    visit legislation_url(@legislation)
    click_on "Edit this legislation", match: :first

    fill_in "Description", with: @legislation.description
    fill_in "Status", with: @legislation.status
    fill_in "Title", with: @legislation.title
    fill_in "User", with: @legislation.user_id
    click_on "Update Legislation"

    assert_text "Legislation was successfully updated"
    click_on "Back"
  end

  test "should destroy Legislation" do
    visit legislation_url(@legislation)
    click_on "Destroy this legislation", match: :first

    assert_text "Legislation was successfully destroyed"
  end
end
