require "application_system_test_case"

class VotesTest < ApplicationSystemTestCase
  setup do
    @vote = votes(:one)
  end

  test "visiting the index" do
    visit votes_url
    assert_selector "h1", text: "Votes"
  end

  test "should create vote" do
    visit votes_url
    click_on "New vote"

    fill_in "Legislation", with: @vote.legislation_id
    fill_in "Politician", with: @vote.politician_id
    fill_in "Type", with: @vote.type
    fill_in "User", with: @vote.user_id
    click_on "Create Vote"

    assert_text "Vote was successfully created"
    click_on "Back"
  end

  test "should update Vote" do
    visit vote_url(@vote)
    click_on "Edit this vote", match: :first

    fill_in "Legislation", with: @vote.legislation_id
    fill_in "Politician", with: @vote.politician_id
    fill_in "Type", with: @vote.type
    fill_in "User", with: @vote.user_id
    click_on "Update Vote"

    assert_text "Vote was successfully updated"
    click_on "Back"
  end

  test "should destroy Vote" do
    visit vote_url(@vote)
    click_on "Destroy this vote", match: :first

    assert_text "Vote was successfully destroyed"
  end
end
