require "application_system_test_case"

class PoliticiansTest < ApplicationSystemTestCase
  setup do
    @politician = politicians(:one)
  end

  test "visiting the index" do
    visit politicians_url
    assert_selector "h1", text: "Politicians"
  end

  test "should create politician" do
    visit politicians_url
    click_on "New politician"

    click_on "Create Politician"

    assert_text "Politician was successfully created"
    click_on "Back"
  end

  test "should update Politician" do
    visit politician_url(@politician)
    click_on "Edit this politician", match: :first

    click_on "Update Politician"

    assert_text "Politician was successfully updated"
    click_on "Back"
  end

  test "should destroy Politician" do
    visit politician_url(@politician)
    click_on "Destroy this politician", match: :first

    assert_text "Politician was successfully destroyed"
  end
end
