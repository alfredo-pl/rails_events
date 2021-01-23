require "application_system_test_case"

class ConciertsTest < ApplicationSystemTestCase
  setup do
    @conciert = concierts(:one)
  end

  test "visiting the index" do
    visit concierts_url
    assert_selector "h1", text: "Concierts"
  end

  test "creating a Conciert" do
    visit concierts_url
    click_on "New Conciert"

    fill_in "Date", with: @conciert.date
    fill_in "Duration", with: @conciert.duration
    fill_in "Group", with: @conciert.group_id
    fill_in "People", with: @conciert.people
    click_on "Create Conciert"

    assert_text "Conciert was successfully created"
    click_on "Back"
  end

  test "updating a Conciert" do
    visit concierts_url
    click_on "Edit", match: :first

    fill_in "Date", with: @conciert.date
    fill_in "Duration", with: @conciert.duration
    fill_in "Group", with: @conciert.group_id
    fill_in "People", with: @conciert.people
    click_on "Update Conciert"

    assert_text "Conciert was successfully updated"
    click_on "Back"
  end

  test "destroying a Conciert" do
    visit concierts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conciert was successfully destroyed"
  end
end
