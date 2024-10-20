require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end
  test "Creating a new quote" do
    # Expects to see a Quotes title when we visit quotes#index page
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # Expects to land on New quotes page, with respective h1 title header, when New Quote button is clicked
    click_on "New quote"
    assert_selector "h1", text: "New quote"
  

    # Expects to redirected back to quotes#index page after 
    # filling in name input field with "Capybara quote", and having "Capybara quote"
    # text added to the list
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end


end  